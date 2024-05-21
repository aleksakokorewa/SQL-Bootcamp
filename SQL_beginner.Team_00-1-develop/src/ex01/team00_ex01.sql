WITH RECURSIVE paths AS (
  SELECT point1 AS path, point1, point2, cost 
  FROM cities
  WHERE point1 = 'a'
  UNION
  SELECT CONCAT(paths.path, ',', cities.point1) AS path,
  cities.point1, cities.point2,
  paths.cost + cities.cost 
  FROM paths
  JOIN cities ON paths.point2 = cities.point1
  WHERE path NOT LIKE CONCAT('%', cities.point1, '%')
  ), routes AS (
    SELECT cost AS total_cost,
    CONCAT('{', path, ',', point2, '}') AS tour
    FROM paths
    WHERE LENGTH(path) = 7 AND point2 = 'a'
  )
  SELECT * FROM routes
  WHERE total_cost = (
    SELECT MIN(total_cost)
    FROM routes
  )
  UNION ALL
  SELECT * FROM routes
   WHERE total_cost = (
    SELECT MAX(total_cost)
    FROM routes
  )


  ORDER BY total_cost, tour;