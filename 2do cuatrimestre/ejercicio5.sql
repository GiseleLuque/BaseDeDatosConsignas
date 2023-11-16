SELECT title, Count(*) as peliculas from film
    left join film_actor USING (film_id) --creo que también puede ser film_caategorio
    GROUP by title
    HAVING peliculas < 50;
