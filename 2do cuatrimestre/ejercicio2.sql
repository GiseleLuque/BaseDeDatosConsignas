 create view rental
  (select rental_duration, f.first_name as nombre, rental_date as fecha_del_alquiler
   f.title as pelicula
   from rental r join film.f on r.rental = f.rental);

--me falta seguir arreglando y modificando ya que me sigue saliendo un fallo
