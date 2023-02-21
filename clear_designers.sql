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
)