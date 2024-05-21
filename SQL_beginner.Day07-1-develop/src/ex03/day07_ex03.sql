with  result as ((select p.name, count(p.id)
from person_visits pv
join pizzeria p on pv.pizzeria_id = p.id
group by p.name
order by count desc)

union all

(select p.name, count(p.id)
 from person_order po
 join menu on po.menu_id = menu.id
 join pizzeria p on menu.pizzeria_id = p.id
 group by p.name
 order by count desc))

select name, sum(count) as total_count
from result
group by name
order by total_count desc, name asc;




