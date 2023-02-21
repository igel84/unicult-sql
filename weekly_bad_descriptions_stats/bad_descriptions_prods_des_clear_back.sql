with show_products as(
select id, user_id
from products p
where p.is_show = true
),
clear_designers_back as(
select distinct on (u.id) u.*
from users u
inner join show_products p on u.id = p.user_id 
)
select CURRENT_DATE() as date,
	   cdb.id as user_id,
	   cdb.name as user_name,
	   p.id as product_id,
	   ps.description
from clear_designers_back cdb
left join products p on p.user_id = cdb.id
left join product_sizes ps on ps.product_id = p.id
where (ps.description is null or
	   LENGTH(ps.description) < 15) and 
 	  cdb.name not like 'Ирина Brand'