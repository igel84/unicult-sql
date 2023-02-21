--Категория Мужчины - Футболки и поло - Поло 177
--Установить сезон «Лето»

--Категория Мужчины - Футболки и поло - Футболки 176
--Установить сезон «Лето»

--Категория Мужчины - Шорты 76
--Установить сезон «Лето»
DELETE FROM public.product_features 
WHERE id in (select pf.id 
			 from product_features pf 
			 inner join products p on p.id = pf.product_id
			 where pf.feature_id = 2 and p.category_id in(177, 176, 76));
			
INSERT INTO public.product_features
(product_id, feature_id, value, percentage, created_at, updated_at)
select id, 2, 'Лето', NULL, now(), now()
from products p 
where category_id in (177, 176, 76);

UPDATE public.product_features 
SET value='Лето'
WHERE id in (select pf.id 
from product_features pf 
inner join products p on p.id = pf.product_id
where pf.feature_id = 2 and
--Категория Женщины - Головные уборы - Кепки 184
	(p.category_id = 184 and pf.value in ('Всесезонный')) or
--Категория Женщины - Кимоно 237
	(p.category_id = 237 and pf.value in ('Всесезонный')) or
--Категория Женщины - Комбинезоны 98
	(p.category_id = 98 and pf.value in ('Всесезонный')) or
--Категория Женщины - Корсеты 238
	(p.category_id = 238 and pf.value in ('Всесезонный')) or
--Категория Женщины - Платья - Вечерние платья 12
	(p.category_id = 12 and pf.value in ('Демисезонный', 'Не задано')) or
--Категория Женщины - Платья - Короткие платья 183
	(p.category_id = 183 and pf.value in ('Лето')) or
--Категория Женщины - Топы и майки - Майки 143
	(p.category_id = 143 and pf.value in ('Всесезонный')) or
--Категория Женщины - Топы и майки - Топы 30 
	(p.category_id = 30 and pf.value in ('Всесезонный', 'Не задано')) or
--Категория Женщины - Футболки и туники - Футболки 176
	(p.category_id = 176 and pf.value in ('Всесезонный')) or
--Категория Дети - Девочки - Платья 226
	(p.category_id = 226 and pf.value in ('Всесезонный')) or
--Категория Дети - Девочки - Юбки 225
	(p.category_id = 225 and pf.value in ('Всесезонный')) or
--Категория Дети - Мальчики - Футболки 223
	(p.category_id = 223 and pf.value in ('Всесезонный')) or