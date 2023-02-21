select _1st, _2nd, _3rd, page, 
		count(distinct tmp.id) as total,
		count(distinct tmp.id) filter(where is_available) as available_count
from(
	select ancestry, c.id as cat_id, c.name, p.id, p.is_available, ranking,
	row_number() over(partition by c.id order by ranking desc ) as position_in_cat,
	ceil(row_number() over(partition by c.id order by ranking desc )/45::numeric) as page
	from products p 
	left join categories c on c.id = p.category_id
	where is_show
	order by ranking desc) tmp
left join (select c3.id, c1."name" as _1st ,c2."name" as _2nd, c3."name" as _3rd
			from categories c3 
			left join categories c2 on c2.id = (string_to_array(c3.ancestry, '/'))[2]::int
			left join categories c1 on c1.id = (string_to_array(c3.ancestry, '/'))[1]::int ) full_cats on full_cats.id = tmp.cat_id
group by full_cats.id, _1st, _2nd, _3rd, page