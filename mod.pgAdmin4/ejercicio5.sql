INSERT INTO "user"( username, password)
	VALUES ('Iara', (SELECT password FROM "user" WHERE username iLIKE 'Tobias%'));