CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopRatedMovies`()
BEGIN
    SELECT m.title, AVG(r.rating) AS average_rating
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.movie_id
    ORDER BY average_rating DESC
    LIMIT 5;
END