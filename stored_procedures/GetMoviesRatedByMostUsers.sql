CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMoviesRatedByMostUsers`()
BEGIN
    SELECT m.title, COUNT(r.user_id) AS user_count
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.movie_id
    ORDER BY user_count DESC
    LIMIT 5;
END