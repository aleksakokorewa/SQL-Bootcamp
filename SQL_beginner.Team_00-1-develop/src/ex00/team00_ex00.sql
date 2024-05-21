CREATE TABLE cities (
    id BIGINT PRIMARY KEY, point1 VARCHAR NOT NULL, point2 VARCHAR NOT NULL, cost INTEGER NOT NULL
);

INSERT INTO cities VALUES (1, 'a', 'b', 10);

INSERT INTO cities VALUES (2, 'b', 'a', 10);

INSERT INTO cities VALUES (3, 'a', 'd', 20);

INSERT INTO cities VALUES (4, 'd', 'a', 20);

INSERT INTO cities VALUES (5, 'a', 'c', 15);

INSERT INTO cities VALUES (6, 'c', 'a', 15);

INSERT INTO cities VALUES (7, 'd', 'c', 30);

INSERT INTO cities VALUES (8, 'c', 'd', 30);

INSERT INTO cities VALUES (9, 'b', 'd', 25);

INSERT INTO cities VALUES (10, 'd', 'b', 25);

INSERT INTO cities VALUES (11, 'b', 'c', 35);

INSERT INTO cities VALUES (12, 'c', 'b', 35);

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
  ORDER BY total_cost, tour;