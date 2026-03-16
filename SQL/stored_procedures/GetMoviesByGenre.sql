CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMoviesByGenre`(IN genre_name VARCHAR(50))
BEGIN
    SELECT m.title
    FROM movies m
    WHERE m.genre = genre_name
    ORDER BY m.created_at DESC
    LIMIT 5;
END