-- Testing the `update_movie_rating` trigger

INSERT INTO movies (title, genre, release_year, rating, duration) 
VALUES ('The Prestige', 'Thriller', 2006, 0.0, 130);

SELECT * FROM users;
INSERT INTO users (first_name, last_name, email, age) 
VALUES
('Alicia', 'Brown', 'alicia@example.com', 25),
('Jake', 'Smith', 'jake@example.com', 30);

-- Insert a rating for the movie
INSERT INTO ratings (user_id, movie_id, rating) 
VALUES
(18, 17, 4.5),  -- Alicia rates 4.5
(19, 17, 3.8);  -- Jake rates 3.8

-- Check if updated automatically
SELECT title, rating FROM movies WHERE title = 'The Prestige';
