SELECT menu.pizza_name, pizzeria.name AS pizzeria_name, menu.price
FROM menu
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
WHERE pizza_name='mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;