with des_lost_cus_sdek as(
select u.id,
count(distinct p.id) filter(where udm.delivery_method_id = 2 and not p.is_moderate_dimensions) as not_mod_dim,
count(distinct p.id) as total_prods
from users u 
inner join legal_entities le on u.id = le.user_id 
left join user_delivery_methods udm on u.id = udm.user_id 
inner join products p on u.id = p.user_id 
inner join product_sizes ps on p.id = ps.product_id 
where (not u.is_test) and 
	  le.is_moderate and 
	  p.is_active and 
	  p.is_moderate and 
	  (not p.is_disparity) and 
	  udm.is_moderate 
group by u.id 
having count(distinct p.id) filter(where udm.delivery_method_id = 2 and not p.is_moderate_dimensions) = count(distinct p.id)
)
select count(*)
from des_lost_cus_sdek