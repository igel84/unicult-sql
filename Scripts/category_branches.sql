@set branch = string_to_array(case when (c.ancestry is null) then c.id::text else concat(c.ancestry, concat('/', c.id)) end, '/')
with category_branch as (
select c.id,
	   ($branch)[1]::int as _1_id,
	   ($branch)[2]::int as _2_id,
	   ($branch)[3]::int as _3_id
from categories c
left join categories c2 on (c.$branch)[1]::int = c2.id
)
select *
from category_branch