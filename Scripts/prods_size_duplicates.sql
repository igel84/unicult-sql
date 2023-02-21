select u.name, tmp.id
from(
select p.id, p.is_show, p.user_id
from products p
left join product_sizes ps on p.id = ps.product_id
left join sizes s on s.id = ps.size_id
group by p.id
having count(s.id) != count(distinct s.id) and (count(s.id) > 1)
order by p.id) tmp
left join product_sizes ps on tmp.id = ps.product_id
left join sizes s on s.id = ps.size_id
left join users u on tmp.user_Id = u.id
group by u.name, tmp.id, tmp.is_show
order by tmp.is_show desc, tmp.id