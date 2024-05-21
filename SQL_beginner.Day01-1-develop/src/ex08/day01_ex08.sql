SELECT order_date, (SELECT CONCAT (tmp.name, '(age:', tmp.age,')')) AS person_information
FROM person_order
NATURAL JOIN 
(SELECT id AS person_id, name, age FROM person) AS tmp
ORDER BY order_date, person_information
