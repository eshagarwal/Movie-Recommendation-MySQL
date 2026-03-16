-- Testing the `update_movie_rating` trigger

INSERT INTO movies (title, genre, release_year, rating, duration) 
VALUES ('Moana', 'Animation', 2007, 0.0, 111);

-- check if added
SELECT title, rating FROM movies WHERE title = 'Moana';

-- Insert a rating for the movie
INSERT INTO ratings (user_id, movie_id, rating) 
VALUES
(18, 20, 9.8),  -- Alicia rates 9.5
(19, 20, 8);  -- Jake rates 8.8

-- Check if updated automatically
SELECT title, rating FROM movies WHERE title = 'Moana';