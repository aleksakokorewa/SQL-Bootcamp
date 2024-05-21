SELECT id, name, age,
CASE 
WHEN age >= 10 AND age <= 20 THEN 'inderval #1'
WHEN age > 20 AND age < 24 THEN 'interval #2'
ELSE 'interval #3'
END AS interval_info
FROM person
ORDER BY interval_info ASC;