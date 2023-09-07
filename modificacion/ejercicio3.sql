--3 Update de usuario y/o pos

UPDATE user
SET password = "la"
WHERE id = 1;

UPDATE user
SET password = "gel"
WHERE id = 3;

UPDATE post
SET body = "do"
WHERE author_id = 2;