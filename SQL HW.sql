# Use Database
USE sakila ;

#1a
SELECT first_name, last_name FROM actor;

#1b 
SELECT CONCAT(first_name,' ',last_name) AS "Actor Name"
FROM actor;

#2a
SELECT actor_id, first_name, last_name 
FROM actor
WHERE first_name = "Joe";

#2b
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%GEN%';

#2c
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

#2d
SELECT country_id, country 
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#3a
ALTER TABLE actor
ADD description BLOB; 

#3b
ALTER TABLE actor
DROP COLUMN description;	

#4a
SELECT last_name, COUNT(*) AS 'number of actors'
FROM actor
GROUP BY last_name;

#4b
SELECT last_name, COUNT(*) AS 'number of actors'
FROM actor
GROUP BY last_name
HAVING COUNT(*) >= 2;

#4c
UPDATE actor
SET first_name = 'Harpo'
WHERE first_name = 'Groucho';

