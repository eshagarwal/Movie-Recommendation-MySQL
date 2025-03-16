CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAverageRatingByGenre`()
BEGIN
    SELECT m.genre, AVG(r.rating) AS average_rating
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.genre
    ORDER BY average_rating DESC
    LIMIT 5;
END