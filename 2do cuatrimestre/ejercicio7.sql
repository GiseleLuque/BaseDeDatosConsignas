DELETE from customer WHERE customer_id  NOT IN (SELECT customer_id FROM rental);
