-- Testing `auto_insert_watch_history` trigger
SELECT * FROM watch_history;

SELECT * FROM USERS;
SELECT * FROM MOVIES;

-- Insert a user's rating for a movie
INSERT INTO ratings (user_id, movie_id, rating) 
VALUES (4, 4, 5.0);

-- It should automically get added
SELECT * FROM watch_history WHERE user_id = 4 AND movie_id = 4;

-- It should not duplicate
INSERT INTO ratings (user_id, movie_id, rating) 
VALUES (4, 4, 4.0);
