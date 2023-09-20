--3.1) Cambiar la duración de alquiler de todas las películas de acción y ponerle un día

UPDATE film set rental_duration = 1 where film_id in (SELECT film_Id from film_category fc JOIN category c on fc.category_id = c.category_id where name = 'Action')