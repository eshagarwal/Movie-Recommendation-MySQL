CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHighlyRatedMoviesByGenre`()
BEGIN
    SELECT m.title, m.genre, AVG(r.rating) AS average_rating
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.genre, m.movie_id
    ORDER BY average_rating DESC
    LIMIT 5;
END