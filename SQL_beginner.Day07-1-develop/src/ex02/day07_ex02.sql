(select p.name, count(po.id) as count, 'order' as action_type
from person_order po
join public.menu on po.menu_id = menu.id
join public.pizzeria p on menu.pizzeria_id = p.id
group by p.name
order by count desc
limit 3)
union
(select p.name, count(pv.id) as count, 'visit' as action_type
from person_visits pv
join public.pizzeria p on pv.pizzeria_id = p.id
group by p.name
order by count desc
limit 3)
order by action_type , count desc ;