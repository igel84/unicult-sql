with designers_not_test as(
select u.*, bool_or(p.is_show) as is_show
from users u
inner join legal_entities le on le.user_id = u.id
inner join products p on p.user_id = u.id
where u.id >= 36 and
	  (u.id not in (38, 65, 66, 67, 110, 329, 372, 547, 582,
	  			   641, 683, 903, 931, 1347, 1348, 1352, 1372,
	  			   1409, 1442, 1474, 1535, 1545, 1561, 1557)) and
	  LOWER(u.name) not like '%test%123%' and 
	  LOWER(u.name) not like '%123%test%' and
	  LOWER(u.name) not like '%test%'
group by u.id
)
select count(distinct dnt.id)
from designers_not_test dnt