with
cat_l1 as(
	select id as id, name as name
	from categories
	where ancestry is null)
,
cat_l2 as(
	select id as id, name as name, (string_to_array(ancestry, '/'))[1]::int as parent_id
	from categories
	where (string_to_array(ancestry, '/'))[2] is null)
,
cat_l3 as(
	select id as id, name as name, (string_to_array(ancestry, '/'))[2]::int as parent_id
	from categories
	where (string_to_array(ancestry, '/'))[2] is not null),
categories_tree as(
	select l1.id as l1_id, l1.name as l1_name, l2.id as l2_id, l2.name as l2_name, l3.id as l3_id, l3.name as l3_name, coalesce(l3.id,l2.id,l1.id) as top_level_category_id
	from cat_l1 l1
	left join cat_l2 l2 on l1.id = l2.parent_id
	left join cat_l3 l3 on l2.id = l3.parent_id
)
select *
from categories_tree ct
order by l2_name

/*
 13) Категория Женщины - Платья - Вечерние платья 12
-Из сезона «Демисезонный» перенести товары в «Зима»
16) Категория Дети - Мальчики - Костюмы 219
-Из сезона «Осень» перенести товары в «Зима»
*/