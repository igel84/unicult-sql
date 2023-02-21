UPDATE public.product_features 
SET value='Зима'
WHERE id in (select pf.id 
from product_features pf 
inner join products p on p.id = pf.product_id
where pf.feature_id = 2 and
--Категория Женщины - Платья - Вечерние платья 12
	(p.category_id = 12 and pf.value in ('Демисезонный')));
