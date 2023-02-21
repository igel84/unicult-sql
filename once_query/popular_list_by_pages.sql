with designers_not_test as(
select 
	   u.id as id,
	   u.name as name
from users u
inner join legal_entities le on le.user_id = u.id
where u.id >= 36 and 
	  (u.id not in (38, 65, 66, 67, 110, 329, 372, 547, 582,
	  			   641, 683, 903, 931, 1347, 1348, 1352, 1372,
	  			   1409, 1442, 1474, 1535, 1545, 1561, 1557))
order by u.id
)
select p.id, dnt.name, p."name", p.view_count, p.fake_view_count, p.ranking,
	   (row_number() over(order by p.ranking desc)/24 + 1) as page_num 
from products p
inner join designers_not_test dnt on dnt.id = p.user_id
order by p.view_count DESC, p.fake_view_count DESC