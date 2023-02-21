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
group by u.id)
select c1.id,
		coalesce(c3."name", c1."name") as _1st,
		case when c3.name is null then null when c3."name" is not null then coalesce(c2."name", c1."name") end as _2nd,
		case when c2.name is null then null when c2."name" is not null then c1."name" end as _3rd,
		round(avg(round(avg(p.price),2)) over(partition by coalesce(c3."name", c1."name"), case when c3.name is null then null when c3."name" is not null then coalesce(c2."name", c1."name") end),2) as _2nd_AVG_price,
		round(avg(p.price),2) as _3rd_AVG_price
from designers_not_test dnt
inner join products p on p.user_id = dnt.id
left join categories c1 on p.category_id = c1.id
left join categories c2 on c2.id = (string_to_array(c1.ancestry, '/'))[2]::int
left join categories c3 on c3.id = (string_to_array(c1.ancestry, '/'))[1]::int
group by c1.id, c1."name", c2."name", c3."name"
order by _1st, _2nd, _3rd