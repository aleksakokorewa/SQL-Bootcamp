SELECT name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id 
          AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
WHERE person.address IN ('Moscow', 'Samara') 
        AND person.gender='male'
ORDER BY name DESC;