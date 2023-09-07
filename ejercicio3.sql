--3) Borrar todas las ciudades que no tienen direcciones
DELETE from city WHERE city_id  NOT IN (SELECT city_id FROM address);

--luego todos los países que no tienen ciudades.
DELETE from country WHERE country_id  NOT IN (SELECT country_id FROM city);