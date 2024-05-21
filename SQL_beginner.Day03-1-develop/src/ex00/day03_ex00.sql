SELECT menu.pizza_name AS pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN person ON person_visits.person_id = person.id 
WHERE person.name = 'Kate' AND menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name, menu.price, pizzeria_name;