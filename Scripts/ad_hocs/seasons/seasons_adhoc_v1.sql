DELETE FROM public.product_features 
WHERE id in (select pf.id 
			 from product_features pf 
			 inner join products p on p.id = pf.product_id
			 where pf.feature_id = 2 and p.category_id in (204, 235, 115, 112, 233, 152, 153));
			
UPDATE public.product_features 
SET value='Весна-Осень'
WHERE id in (select pf.id 
from product_features pf 
inner join products p on p.id = pf.product_id
where pf.feature_id = 2 and
--Женщины - Брюки - Классические брюки 43
--Женщины - Брюки - Лосины 181
--Женщины - Брюки - Повседневные брюки 186
--Женщины - Брюки - Спортивные брюки 182
	 (p.category_id = 43 and pf.value in ('Демисезонный', 'Осень')) or
	 (p.category_id = 181 and pf.value in ('Демисезонный', 'Осень')) or
	 (p.category_id = 186 and pf.value in ('Демисезонный', 'Осень')) or
	 (p.category_id = 182 and pf.value in ('Демисезонный', 'Осень')) or 
--Женщины - Верхняя одежда - Бомберы 106
--Женщины - Верхняя одежда - Куртки 107
--Женщины - Верхняя одежда - Пальто 131
--Женщины - Верхняя одежда - Плащи и тренчкоты 102
--Женщины - Верхняя одежда - Шубы и дубленки 116
	 (p.category_id = 106 and pf.value in ('Всесезонный', 'Не задано')) or
	 (p.category_id = 107 and pf.value = 'Осень') or
	 (p.category_id = 131 and pf.value = 'Осень') or
	 (p.category_id = 102 and pf.value in ('Демисезонный', 'Лето', 'Не задано', 'Осень')) or 
	 (p.category_id = 116 and pf.value = 'Осень') or
--Женщины - Головные уборы - Кепки 184
--Женщины - Головные уборы - Косынки 126
--Женщины - Головные уборы - Шапки 124
--Женщины - Головные уборы - Шляпы 125
	 (p.category_id = 184 and pf.value = 'Демисезонный') or
	 (p.category_id = 126 and pf.value in ('Всесезонный', 'Демисезонный')) or
	 (p.category_id = 124 and pf.value in ('Осень', 'Демисезонный'))or
	 (p.category_id = 125 and pf.value = 'Всесезонный') or 
--Женщины - Джемперы, свитеры и кардиганы - Водолазки 134
--Женщины - Джемперы, свитеры и кардиганы - Джемперы и пуловеры 135
     (p.category_id = 134 and pf.value in ('Всесезонный', 'Осень')) or
	 (p.category_id = 135 and pf.value in ('Всесезонный', 'Демисезонный')));

