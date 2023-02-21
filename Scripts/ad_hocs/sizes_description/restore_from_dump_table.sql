UPDATE public.product_sizes AS tgt
SET description=src.description
FROM product_sizes_dump AS src
WHERE tgt.id=src.id;
select p.id, ps.description 
from product_sizes ps
left join products p on ps.product_id = p.id
order by length(ps.description) desc;