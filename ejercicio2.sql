--2) borrar los idiomas que no estan en ninguna pelicula
--delete = borrar
DELETE FROM language  WHERE language_id in 
(SELECT g.language_id FROM language g LEFT JOIN film t on g.language_id = t.language_Id
WHERE film_id IS NULL);