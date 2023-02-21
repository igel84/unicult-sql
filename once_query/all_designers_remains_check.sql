with designers_not_test as(
select u.*
from users u
inner join legal_entities le on le.user_id = u.id
where u.id >= 36 and
	  (u.id not in (38, 65, 66, 67, 110, 329, 372, 547, 582,
	  			   641, 683, 903, 931, 1347, 1348, 1352, 1372,
	  			   1409, 1442, 1474, 1535, 1545, 1561, 1557)) and
	  LOWER(u.name) not like '%test%123%' and 
	  LOWER(u.name) not like '%123%test%'
),
designers_by_remains as(
select dnt.id, dnt."name" , dnt.days_left_to_check_remains, max(p.is_show::int) as is_show
from designers_not_test dnt
left join products p on dnt.id = p.user_id
group by dnt.id, dnt."name" , dnt.days_left_to_check_remains
order by is_show DESC NULLS LAST,
 		 days_left_to_check_remains DESC NULLS LAST
 )
 select dbr.id, le."name", dbr.name, le.email, dbr.days_left_to_check_remains, dbr.is_show
 from designers_by_remains dbr
 inner join legal_entities le on le.user_id = dbr.id
 