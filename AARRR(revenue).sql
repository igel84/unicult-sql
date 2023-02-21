select o.id as order_id, o.user_id, oi.product_id, u.id as designer_id, le.comission_percent, oi.sale_price  as gmv, oi.sale_price*le.comission_percent/100 as revenue
from orders o
left join users cu_u on o.user_id = cu_u.id
left join order_items oi on o.id = oi.order_id
left join products p on p.id = oi.product_id
left join users u on u.id = p.user_id
left join legal_entities le on u.id = le.user_id
where (cu_u.is_test and cu_u.is_admin) = false and
	  LOWER(cu_u.name) not like '%test%123%' and 
	  LOWER(cu_u.name) not like '%123%test%' and
	  LOWER(cu_u.name) not like '%test%' and
	  (u.is_test and u.is_admin) = false and
	  LOWER(u.name) not like '%test%123%' and 
	  LOWER(u.name) not like '%123%test%' and
	  LOWER(u.name) not like '%test%' and
	  oi.product_id is not null and oi.order_id = 580