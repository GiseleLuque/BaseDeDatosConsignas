--2.2) Agregar una nueva sucursal (store) en alguna de esas tres ciudades.  Para eso hay que crear una dirección primero.

INSERT INTO address (address, district, city_id, phone)
VALUES ('Rosario 888', "barrio", (SELECT city_id FROM city WHERE city like "Santa Rosa%"), "+5434266778");

INSERT INTO store (address_id)
SELECT address_id FROM address WHERE city_id IN (SELECT city_id FROM city WHERE city like "Rosario");