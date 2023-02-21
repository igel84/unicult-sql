select p.id, ps.description 
from product_sizes ps
left join products p on ps.product_id = p.id
where array_length(regexp_match(ps.description, 'см\.'), 1) >= 1
--where p.id = 3762
--'(?<=\d)[А-ФЦ-Яа-фц-я]'
--'см(?=[^\,$])'
--Обхват груди: 80-84 см	,Обхват под грудью: 68-72 см,Обхват талии: 63-67 см,Обхват бедер: 87-91 см
--Обхват головы : 60 см