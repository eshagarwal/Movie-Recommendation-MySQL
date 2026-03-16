DELIMITER //

CREATE TRIGGER update_movie_rating
AFTER INSERT ON ratings
FOR EACH ROW
BEGIN
	DECLARE avg_rating DECIMAL(3, 2);

	SELECT AVG(rating) INTO avg_rating FROM ratings WHERE movie_id = NEW.movie_id;

    UPDATE movies
    SET rating = avg_rating
    WHERE movie_id = NEW.movie_id;
END;

//

DELIMITER ;
