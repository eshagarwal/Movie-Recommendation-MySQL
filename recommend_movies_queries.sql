-- Recommend movies based on ratings
SELECT m.title, AVG(r.rating) AS average_rating
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id
ORDER BY average_rating DESC
LIMIT 5;

--  Recommend movies based on genre 
SELECT m.title
FROM movies m
WHERE m.genre = 'Action'
ORDER BY m.release_year DESC
LIMIT 5;

-- Recommend movies by genre that are highly rated
SELECT m.title, m.genre, AVG(r.rating) AS average_rating
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.genre, m.movie_id
ORDER BY average_rating DESC
LIMIT 5;

-- Average rating of movies in each genre 
SELECT m.genre, AVG(r.rating) AS average_rating
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.genre
ORDER BY average_rating DESC
LIMIT 5;

-- Trending movies  
SELECT m.title, COUNT(w.history_id) AS watch_count
FROM movies m
JOIN watch_history w ON m.movie_id = w.movie_id
GROUP BY m.movie_id
ORDER BY watch_count DESC
LIMIT 5;

-- Recommend movies that are rated by the most number of users 
SELECT m.title, COUNT(r.user_id) AS user_count
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id
ORDER BY user_count DESC
LIMIT 5;



