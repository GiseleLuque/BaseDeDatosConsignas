--1)¿Cuántas películas hay en cada tipo de "rating" (g, pg, pg13, r, nc17)
DROP VIEW ejercicio1;
CREATE VIEW ejercicio1 AS
SELECT rating, count(*) as cantidad
FROM film
GROUP BY rating;

-- 2)¿Cuántas películas hay en cada "categoría"?
CREATE VIEW ejercicio2 AS
SELECT count(*) as cantidad_de_peliculas, c.name
FROM film f JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

--3)Cuales son los 10 actores/actrices que más aparecen en las películas
CREATE VIEW ejercicio3 AS
SELECT count(*) as cantidad, a.first_name as nombre, a.last_name as apellido
FROM film f JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY a.actor_id 
ORDER BY cantidad DESC
LIMIT 10;

--4)¿Cuántos ejemplares (inventory) en total hay en cada local?  Como no hay nombre del local, poner en su lugar la dirección incluyendo ciudad y país además de la cantidad
CREATE VIEW ejercicio4 AS
SELECT count(*) as cantidad_del_local, a.address AS direccion, c.city AS ciudad, co.country AS pais
FROM address a JOIN store s ON a.address_id = s.store_id JOIN city c ON c.city_id = a.city_id JOIN country co ON co.country_id = c.country_id
JOIN inventory i ON i.store_id = s.store_id 
GROUP BY s.store_id, direccion, ciudad, pais
ORDER BY cantidad_del_local;

--5¿Cuántas películas distintas hay en cada local? Como no hay nombre del local, poner en su lugar la dirección incluyendo ciudad y país además de la cantidad
CREATE VIEW ejercicio5 AS
SELECT DISTINCT COUNT(*) AS cantidad_de_peliculas, a.address AS direccion, c.city AS ciudad, co.country AS pais 
FROM address a JOIN store s ON a.address_id = s.store_id
JOIN city c ON c.city_id = a.city_id
JOIN country co ON co.country_id = c.country_id
JOIN inventory i ON i.store_id = s.store_id
JOIN film f ON f.film_id = i.film_id
GROUP BY direccion, ciudad, pais
ORDER BY cantidad_de_peliculas;

--6 Título de la película, dirección, ciudad y país del local de todos los ejemplares que están sin devolver.
CREATE VIEW ejercicio6 AS
SELECT f.title as peliculas, a.address AS direccion,
c.city AS ciudad, co.country AS pais FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NULL
ORDER BY f.title;

--7)Mostrar título, categoría, idioma, rating y duración de las películas que estén entre 1 hs y 2 hs.
CREATE VIEW ejercicio7 AS
SELECT f.title, f.length, f.rating, c.name AS categoria, l.name FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN language l ON l.language_id = f.language_id
WHERE f.length BETWEEN 60 AND 120-- 60 = 1hora, 120 = 2horas
ORDER BY title ASC;

--8)Mostrar nombre, apellido y dirección (con ciudad y país) de los encargados del local.
SELECT a.first_name, a.last_name, d.address, d.city, d.country FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN inventory i ON i.film_id= f.film_id
JOIN store s ON s.store_id = i.store_id
JOIN direcciones d ON s.address_id = d.address_id
GROUP BY d.address_id,a.first_name, a.last_name, d.address,d.city,d.country

CREATE VIEW direcciones AS
SELECT d.address_id, d.address,c.city,co.country  
FROM address d 
JOIN city c ON d.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id

--9)Calcular el costo de alquiler promedio de las película de cada categoría.
CREATE VIEW ejercicio9 AS
SELECT title AS peliculas, avg(rental_duration * rental_rate)AS Promedio_Peliculas
FROM film
GROUP BY peliculas;

--10 Mostrar el título, la fecha mínima y máxima de devolución de todas las películas.
CREATE VIEW ejercicio10 AS
SELECT f.title, MIN(r.return_date), MAX(r.return_date)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id