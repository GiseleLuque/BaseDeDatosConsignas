--4) Borrar la categoría “Horror”, pensar que cosas habría que hacer primero para poder borrarla.
DELETE FROM film_category WHERE category_id IN (SELECT category_id FROM category WHERE name = "Horror");
DELETE FROM category WHERE name = "Horror"; 