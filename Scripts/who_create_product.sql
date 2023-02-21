select v.created_at::date, 
		count(u.id) filter(where not u.is_admin and not u.is_test and u.is_publisher),
		count(u.id) filter(where u.is_admin)
from versions v 
left join users u on u.id = v.whodunnit::int
where item_type = 'Product' and "event" = 'create' and 
	  u.id >= 36 and
	  (u.id not in (38, 65, 66, 67, 110, 329, 372, 547, 582,
	  			   641, 683, 903, 931, 1347, 1348, 1352, 1372,
	  			   1409, 1442, 1474, 1535, 1545, 1561, 1557)) and
	  LOWER(u.name) not like '%test%123%' and 
	  LOWER(u.name) not like '%123%test%' and
	  LOWER(u.name) not like '%test%'
group by v.created_at::date
order by v.created_at::date