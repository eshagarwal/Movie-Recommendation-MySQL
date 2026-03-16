CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTrendingMovies`()
BEGIN
    SELECT m.title, COUNT(w.history_id) AS watch_count
    FROM movies m
    JOIN watch_history w ON m.movie_id = w.movie_id
    GROUP BY m.movie_id
    ORDER BY watch_count DESC
    LIMIT 5;
END