select cn.name,
	   string_agg(concat(c.ancestry, concat('/', c.id)), ','),
	   array_agg(distinct c."name") as categories,
	   array_agg(distinct p.id) as items,
	   count(distinct p.id) filter(where p.is_show) as is_show,
	   count(distinct p.id) filter(where p.is_show and p.is_available) as is_available
from categories c 
left join products p on p.category_id = c.id
left join categories cn on (string_to_array(concat(c.ancestry, concat('/', c.id::varchar)), '/'))[2]::int = cn.id
group by (string_to_array(concat(c.ancestry, concat('/', c.id::varchar)), '/'))[2], cn."name"