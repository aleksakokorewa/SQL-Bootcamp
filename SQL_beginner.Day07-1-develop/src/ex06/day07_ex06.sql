select p.name,
       count(po.menu_id) as count_of_orders,
       round(avg(m.price),2) as average_price,
       max(m.price) as max_price,
       min(m.price) as min_price
from public.person_order po
join menu m on po.menu_id = m.id
join pizzeria p on m.pizzeria_id = p.id
group by p.name
order by p.name;
