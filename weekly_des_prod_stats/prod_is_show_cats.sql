select count(p.id) filter(where ancestry like '1%') as prod_wo,
	   count(p.id) filter(where ancestry like '64%') as prod_ma,
	   count(p.id) filter(where ancestry like '77%') as prod_ch,
	   count(p.id) filter(where ancestry is not null) as prod_all,
	   null as measure_diff1
from products p
left join categories c on c.id = p.category_id
where p.is_show = TRUE