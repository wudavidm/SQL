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

#4d
SELECT * FROM actor
WHERE first_name = 'Harpo' and last_name = 'Williams';

UPDATE actor
SET first_name = 'Groucho'
WHERE actor_id = 172;

#5a
Describe address;

#6a
SELECT s.first_name, s.last_name, a.address
FROM staff s
INNER JOIN address a
ON s.address_id = a.address_id;

#6b
SELECT s.first_name, s.last_name, SUM(p.amount) AS 'Total Payment' 
FROM staff s
JOIN payment p
ON s.staff_id = p.staff_id 
WHERE p.payment_date LIKE '2005-08%' 
GROUP BY p.staff_id;

#6c
SELECT f.title, COUNT(fa.actor_id) AS 'Total Actors'
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title;

#6d
SELECT f.title, COUNT(i.film_id) as 'Copies'
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
WHERE title = 'Hunchback Impossible'
GROUP BY title;

#6e
SELECT c.first_name, c.last_name, SUM(p.amount) as 'Total Amount Paid'
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY last_name 
ORDER BY last_name ASC;

 #7a
 SELECT title 
 FROM film  
 WHERE language_id IN 
	(SELECT language_id FROM language WHERE name = 'English' ) 
    AND (title LIKE 'K%') OR (title LIKE 'Q%');


#7b
SELECT first_name, last_name
FROM actor
WHERE actor_id IN 
	(SELECT actor_id FROM film_actor WHERE film_id IN 
		(SELECT film_id FROM film WHERE title = "Alone Trip"));

Select * from customer_list;
select * from customer;



#7c
SELECT first_name, last_name, email
FROM customer c
RIGHT JOIN customer_list cl
ON cl.ID = c.customer_id
WHERE country = 'Canada';



