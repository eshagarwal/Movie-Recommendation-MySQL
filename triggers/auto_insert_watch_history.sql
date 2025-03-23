DELIMITER //

CREATE TRIGGER auto_insert_watch_history
AFTER INSERT ON ratings
FOR EACH ROW
BEGIN
	DECLARE does_exist BOOL DEFAULT FALSE;

	SELECT TRUE INTO does_exist
    FROM watch_history
    WHERE user_id = NEW.user_id AND movie_id = NEW.movie_id;

	IF does_exist = FALSE THEN
		INSERT INTO watch_history (user_id, movie_id, watched_at)
        VALUES
        (NEW.user_id, NEW.movie_id, NOW());
    END IF;
END;

//

DELIMITER ;
