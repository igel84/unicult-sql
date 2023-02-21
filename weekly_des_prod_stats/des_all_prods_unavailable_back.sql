with des_all_prods_unavailable_back as(
select u.id
from users u 
inner join legal_entities le on u.id = le.user_id 
inner join products p on u.id = p.user_id 
inner join user_delivery_methods udm on u.id = udm.user_id 
left join product_sizes ps on p.id = ps.product_id 
where (not u.is_test) and 
	  le.is_moderate and 
	  p.is_active and 
	  p.is_moderate and 
	  (not p.is_disparity) and
	  udm.is_moderate and
	  ((not udm.delivery_method_id = 2) or (p.is_moderate_dimensions and not((p.length is null) or (p.width is null) or (p.height is null))))
group by u.id
having count(ps.id) filter(where (p.is_preorder and p.max_pre_order = 0 and ps.count = 0) or (not p.is_preorder and ps.count = 0)) = count(ps.id)
)
select count(*)
from des_all_prods_unavailable_back
