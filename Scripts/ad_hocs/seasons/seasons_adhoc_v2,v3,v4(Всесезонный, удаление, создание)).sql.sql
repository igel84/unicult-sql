--Категория Женщины - Сумки и рюкзаки 86
--Удалить сезон «Всесезонный»
--Категория Женщины - Носки 192
--Установить сезон «Всесезонный»
--Категория Мужчины - Носки 194
--Установить сезон «Всесезонный»
DELETE FROM public.product_features 
WHERE id in (select pf.id 
			 from product_features pf 
			 inner join products p on p.id = pf.product_id
			 where pf.feature_id = 2 and p.category_id in(86, 192, 194));
			
INSERT INTO public.product_features
(product_id, feature_id, value, percentage, created_at, updated_at)
select id, 2, 'Всесезонный', NULL, now(), now()
from products p 
where category_id in (192, 194);

UPDATE public.product_features 
SET value='Всесезонный'
WHERE id in (select pf.id 
from product_features pf 
inner join products p on p.id = pf.product_id
where pf.feature_id = 2 and
--Категория Женщины - Домашняя одежда 155
	(p.category_id = 155 and pf.value in ('Лето', 'Не задано')) or
--Категория Женщины - Рубашки и блузки 24
	(p.category_id = 24 and pf.value in ('Весна-Осень', 'Демисезонный', 'Осень', 'Не задано')) or
--Категория Мужчины - Домашняя одежда 188
	(p.category_id = 188 and pf.value in ('Зима', 'Не задано')) or
--Категория Мужчины - Обувь 2
	(p.category_id = 2 and pf.value in ('Осень')) or
--Категория Мужчины - Рубашки - Классические рубашки 164
	(p.category_id = 239 and pf.value in ('Демисезонный')) or
--Категория Женщины - Спортивная одежда 89, 240
	(p.category_id = 239 and pf.value in ('Лето')))