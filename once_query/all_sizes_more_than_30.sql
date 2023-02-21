with designers_not_test as(
select 
	   u.id as id,
	   u.name as name,
	   u.days_left_to_check_remains 
from users u
inner join legal_entities le on le.user_id = u.id
where u.id >= 36 and 
	  u.id not in (38, 65, 66, 67, 110, 329, 372, 547, 582, 641,
	  			   683, 903, 931, 1347, 1348, 1352, 1372,
	  			   1409, 1442, 1474, 1535, 1545, 1561)
order by u.id
)
select dnt.id as des_id, p.id as p_id, count(ps.id) as sizes_count, sum(ps.count) as prods_total,
	   min(dnt.days_left_to_check_remains) as days_left
from products p
inner join designers_not_test dnt on dnt.id = p.user_id
left join product_sizes ps on ps.product_id = p.id
group by dnt.id, p.id 
HAVING count(ps.id)*20 <= sum(ps.count)
order by 2 desc NULLS LAST