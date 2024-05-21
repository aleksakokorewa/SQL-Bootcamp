select p.address, pz.name, count(po.id) as count_of_orders
from person_order po
join person p on po.person_id = p.id
join menu m on po.menu_id = m.id
join pizzeria pz on m.pizzeria_id = pz.id
group by p.address, pz.name
order by p.address, pz.name;
