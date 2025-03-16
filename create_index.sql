CREATE INDEX movies_title ON movies (title);

-- searching a movie 
SELECT * FROM movies
WHERE title = 'Inception';
