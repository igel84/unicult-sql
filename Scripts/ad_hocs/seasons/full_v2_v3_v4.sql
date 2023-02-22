--Категория Женщины - Сумки и рюкзаки 86
--Удалить сезон «Не задано»

--Категория Мужчины - Аксессуары 90, 205
--Удалить сезон «Не задано»
DELETE FROM public.product_features 
WHERE id in (select pf.id 
			 from product_features pf 
			 inner join products p on p.id = pf.product_id
			 where pf.feature_id = 2 and p.category_id in(86,90,205) and pf.value = 'Не задано');
			
--Категория Дети - Новорожденные - Конверты и одеяла 207
--Удалить сезоны

--Категория Дети - Новорожденные - Пеленки 209
--Удалить сезоны
			
--Категория Дети - Девочки - Жакеты 227
--Установить всем «Весна- осень»

--Категория Женщины - Обувь 201
--Выставить сезон «Весна-осень»

--Категория Мужчины - Джемперы, свитеры и кардиганы - Кардиганы 185
--Установить сезон «Весна-Осень»

--Категория Мужчины -Свитшоты и Худи - Толстовки 170
--Установить сезон «Весна-осень»
DELETE FROM public.product_features 
WHERE id in (select pf.id 
			 from product_features pf 
			 inner join products p on p.id = pf.product_id
			 where pf.feature_id = 2 and p.category_id in(207, 209, 227, 201, 185, 170));
			
INSERT INTO public.product_features
(product_id, feature_id, value, percentage, created_at, updated_at)
select id, 2, 'Весна–Осень', NULL, now(), now()
from products p 
where category_id in (227, 201, 185, 170);

UPDATE public.product_features 
SET value='Весна–Осень'
WHERE id in (select pf.id 
from product_features pf 
inner join products p on p.id = pf.product_id
where pf.feature_id = 2 and
--Категория Женщины - Джемперы, свитеры и кардиганы - Кардиганы  239
	 (p.category_id = 239 and pf.value in ('Демисезонный', 'Всесезонный', 'Лето', 'Не задано')) or
--Категория Женщины - Джинсы 44
	 (p.category_id = 44 and pf.value in ('Всесезонный')) or
--Категория Женщины - Костюмы и пиджаки - Жакеты 138
	 (p.category_id = 138 and pf.value in ('Демисезонный', 'Всесезонный', 'Осень')) or
--Категория Женщины - Костюмы и пиджаки - Жилеты 139
	 (p.category_id = 139 and pf.value in ('Демисезонный', 'Всесезонный', 'Зима', 'Лето', 'Осень')) or
--Категория Женщины - Костюмы и пиджаки - Костюмы 141
	 (p.category_id = 141 and pf.value in ('Всесезонный', 'Осень')) or
--Категория Женщины - Костюмы и пиджаки - Пиджаки 140
	 (p.category_id = 140 and pf.value in ('Всесезонный', 'Не задано')) or
--Категория Женщины - Платья - Вечерние платья 12
	 (p.category_id = 12 and pf.value in ('Осень')) or
--Категория Женщины - Платья - Короткие платья 183
	 (p.category_id = 183 and pf.value in ('Всесезонный')) or
--Категория Женщины - Платья - Платья 17
	 (p.category_id = 17 and pf.value in ('Всесезонный', 'Демисезонный')) or
--v.3
--Категория Женщины - Платья - Платья 17
	 (p.category_id = 17 and pf.value in ('Осень')) or
--Категория Женщины - Платья - Сарафаны 142
	 (p.category_id = 142 and pf.value in ('Всесезонный')) or
--Категория Женщины - Свитшоты и худи - Свитшоты 120
	 (p.category_id = 120 and pf.value in ('Демисезонный', 'Всесезонный','Лето', 'Осень')) or
--Категория Женщины - Свитшоты и худи - Толстовки 136
	 (p.category_id = 136 and pf.value in ('Всесезонный')) or
--Категория Женщины - Свитшоты и худи - Худи 137
	 (p.category_id = 137 and pf.value in ('Всесезонный', 'Осень')) or
--Категория Женщины - Спортивная одежда 94, 203
	 (p.category_id in(94, 203) and pf.value in ('Осень')) or
--Категория Женщины - Футболки и туники - Лонгсливы 147
	 (p.category_id = 147 and pf.value in ('Демисезонный', 'Всесезонный','Осень')) or
--Категория Женщины - Юбки (смотрела по 2 категории, так как мложно многие юбки определить в узкие/широкие. Много товаров только во 2 категории): 54, 129, 130
	 (p.category_id in(54,129,130) and pf.value in ('Демисезонный', 'Всесезонный', 'Лето', 'Осень', 'Не задано')) or
--Категория Мужчины - Брюки - Классические брюки 162
	 (p.category_id = 162 and pf.value in ('Всесезонный')) or
--Категория Мужчины - Брюки - Повседневные брюки 163
	 (p.category_id = 163 and pf.value in ('Демисезонный', 'Всесезонный')) or
--Категория Мужчины - Верхняя одежда - Куртки 65
	 (p.category_id = 65 and pf.value in ('Демисезонный')) or
--Категория Мужчины - Верхняя одежда - Плащи и тренчкоты 158
	 (p.category_id = 158 and pf.value in ('Демисезонный')) or
--Категория Мужчины - Головные уборы 96
	 (p.category_id = 96 and pf.value in ('Осень')) or
--Категория Мужчины - Костюмы и пиджаки - Жакеты 172
	 (p.category_id = 172 and pf.value in ('Демисезонный')) or
--Категория Мужчины - Костюмы и пиджаки - Пиджаки 174
	 (p.category_id = 174 and pf.value in ('Демисезонный', 'Всесезонный')) or
--Категория Мужчины - Свитшоты и Худи - Свитшоты 169
	 (p.category_id = 169 and pf.value in ('Демисезонный', 'Всесезонный','Осень')) or
--Категория Мужчины -Свитшоты и Худи - Худи 171
	 (p.category_id = 171 and pf.value in ('Осень')) or
--v.4
--Категория Мужчины - Спортивная одежда - Костюмы 203
	 (p.category_id = 203 and pf.value in ('Всесезонный')) or
--Категория Дети - Девочки - Брюки и комбинезоны 210
	 (p.category_id = 210 and pf.value in ('Всесезонный','Осень')) or
--Категория Дети - Девочки - Вехняя одежда 212
	 (p.category_id = 212 and pf.value in ('Демисезонный')) or
--Категория Дети - Девочки - Джемперы и кардиганы 214
	 (p.category_id = 214 and pf.value in ('Зима','Осень')) or
--Категория Дети - Девочки - Костюмы 218
	 (p.category_id = 218 and pf.value in ('Всесезонный')) or
--Категория Дети - Девочки - Платья 226
	 (p.category_id = 226 and pf.value in ('Осень')) or
--Категория Дети - Девочки - Свитшоты и худи 220
	 (p.category_id = 220 and pf.value in ('Всесезонный')) or
--Категория Дети - Девочки - Юбки 225
	 (p.category_id = 225 and pf.value in ('Демисезонный','Осень')) or
--Категория Дети - Мальчики - Брюки и комбинезоны 211
	 (p.category_id = 211 and pf.value in ('Всесезонный','Осень')) or
--Категория Дети - Мальчики - Верхняя одежда 213
	 (p.category_id = 213 and pf.value in ('Демисезонный')) or
--Категория Дети - Мальчики - Джемперы и кардиганы 215
	 (p.category_id = 215 and pf.value in ('Демисезонный')) or
--Категория Дети - Мальчики - Костюмы 219
	 (p.category_id = 219 and pf.value in ('Всесезонный','Осень')) or
--Категория Дети - Мальчики - Свитшоты и худи 221
	 (p.category_id = 221 and pf.value in ('Всесезонный')) or
--Категория Дети - Мальчики - Шорты 224
	 (p.category_id = 224 and pf.value in ('Всесезонный')));
--Лето
--Категория Мужчины - Футболки и поло - Поло 187
--Установить сезон «Лето»
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
			 where pf.feature_id = 2 and p.category_id in(187, 177, 176, 76));
			
INSERT INTO public.product_features
(product_id, feature_id, value, percentage, created_at, updated_at)
select id, 2, 'Лето', NULL, now(), now()
from products p 
where category_id in (187, 177, 176, 76);

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
	(p.category_id = 12 and pf.value in ('Всесезонный', 'Не задано')) or
--Категория Женщины - Платья - Короткие платья 183
	(p.category_id = 183 and pf.value in ('Лето')) or
--Категория Женщины - Топы и майки - Майки 143
	(p.category_id = 143 and pf.value in ('Всесезонный')) or
--Категория Женщины - Топы и майки - Топы 30 
	(p.category_id = 30 and pf.value in ('Всесезонный', 'Не задано')) or
--Категория Женщины - Футболки и туники - Футболки 144
	(p.category_id = 144 and pf.value in ('Всесезонный')) or
--Категория Дети - Девочки - Платья 226
	(p.category_id = 226 and pf.value in ('Всесезонный')) or
--Категория Дети - Девочки - Юбки 225
	(p.category_id = 225 and pf.value in ('Всесезонный')) or
--Категория Дети - Мальчики - Футболки 223
	(p.category_id = 223 and pf.value in ('Всесезонный')));
--Всесезонный
--Категория Женщины - Сумки и рюкзаки 86
--Удалить сезон «Всесезонный»
DELETE FROM public.product_features 
WHERE id in (select pf.id 
			 from product_features pf 
			 inner join products p on p.id = pf.product_id
			 where pf.feature_id = 2 and p.category_id = 86 and value='Всесезонный');	
--Категория Женщины - Носки 192
--Установить сезон «Всесезонный»
	
--Категория Мужчины - Носки 194
--Установить сезон «Всесезонный»
DELETE FROM public.product_features 
WHERE id in (select pf.id 
			 from product_features pf 
			 inner join products p on p.id = pf.product_id
			 where pf.feature_id = 2 and p.category_id in(86,192, 194));
			
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
	(p.category_id = 24 and pf.value in ('Весна–Осень', 'Демисезонный', 'Осень', 'Не задано')) or
--Категория Мужчины - Домашняя одежда 188
	(p.category_id = 188 and pf.value in ('Зима', 'Не задано')) or
--Категория Мужчины - Обувь 2
	(p.category_id = 2 and pf.value in ('Осень')) or
--Категория Мужчины - Рубашки - Классические рубашки 164
	(p.category_id = 164 and pf.value in ('Демисезонный')) or
--Категория Женщины - Спортивная одежда 89, 240
	(p.category_id in (89,240) and pf.value in ('Лето')));
--Зима
UPDATE public.product_features 
SET value='Зима'
WHERE id in (select pf.id 
from product_features pf 
inner join products p on p.id = pf.product_id
where pf.feature_id = 2 and
--Категория Женщины - Платья - Вечерние платья 12
	(p.category_id = 12 and pf.value in ('Демисезонный')) or
--Категория Дети - Мальчики - Костюмы 219
	(p.category_id = 139 and pf.value in ('Осень')));
