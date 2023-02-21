@set dirty_designers = not u.is_test and u.is_confirmed and is_publisher and not is_admin and le.is_moderate
WITH clear_users AS(
SELECT *
FROM USERS
WHERE NOT is_test AND
      is_confirmed AND
      NOT is_admin
),
designer_users as(
select cu.*
from clear_users cu
inner join legal_entities le on cu.id = le.user_id
where le.is_moderate
),
clear_products AS(
SELECT distinct on(p.id) p.*
from PRODUCTS p
left join product_sizes ps on p.id = ps.product_id
where p.is_moderate and
      p.is_active   and
      ps.in_stock   and
      ((ps.count > 0) or
      (is_preorder and max_pre_order > 0))
),
clear_designers as(
select distinct on (d.id) d.*
from designer_users d
inner join clear_products cp on d.id = cp.user_id
left join user_delivery_methods udm on d.id = udm.user_id
left join delivery_methods dm on dm.id = udm.delivery_method_id
where udm.is_active   and
      udm.is_moderate and
      dm.is_active    and
      (dm.id in (1, 4) or
      (dm.id in (2) and cp.is_moderate_dimensions))
),
dirty_sizes as(
select s.id as size_id, u.id, s.value  
FROM users u
left join legal_entities le on u.id = le.user_id 
LEFT JOIN products p ON u.id = p.user_id
LEFT JOIN product_sizes ps on p.id = ps.product_id  
left join sizes s on s.id = ps.size_id
WHERE $dirty_designers
),
clear_sizes as(
select s.id as size_id, u.id , s.value 
from clear_designers u
left join products p on u.id = p.user_id
left join product_sizes ps on p.id = ps.product_id
left join sizes s on s.id = ps.size_id
),
sizes_table as(
select ds.size_id, ds.value, count(distinct ds.id) as dirty_designers, count(distinct cs.id) as clear_designers
from dirty_sizes ds
left join clear_sizes cs on cs.size_id = ds.size_id
group by ds.size_id, ds.value
),
cat_list as(
select s.id, string_agg(c."name", ', ')
from sizes s
left join category_sizes cs ON s.id = cs.size_id 
left join categories c on c.id = cs.category_id
group by s.id, s.value
)
select size_id, value, dirty_designers, clear_designers, string_agg
from sizes_table st
left join cat_list cl on st.size_id = cl.id