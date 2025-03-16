INSERT INTO users (first_name, last_name, email, age) 
VALUES 
('John', 'Doe', 'john@example.com', 30),
('Jane', 'Smith', 'jane@example.com', 25),
('Alice', 'Johnson', 'alice@example.com', 28),
('Bob', 'Brown', 'bob@example.com', 35),
('Emma', 'Davis', 'emma@example.com', 27),
('Michael', 'Clark', 'michael@example.com', 32),
('Sophia', 'Wilson', 'sophia@example.com', 26),
('David', 'Lee', 'david@example.com', 29),
('Olivia', 'Turner', 'olivia@example.com', 24),
('Liam', 'Scott', 'liam@example.com', 31),
('Ethan', 'Adams', 'ethan@example.com', 23),
('Isabella', 'White', 'isabella@example.com', 34),
('Lucas', 'Harris', 'lucas@example.com', 36),
('Charlotte', 'Martinez', 'charlotte@example.com', 22),
('Amelia', 'Moore', 'amelia@example.com', 33);


INSERT INTO movies (title, genre, release_year, rating, duration) 
VALUES 
('Gladiator', 'Action', 2000, 8.5, 155),
('Titanic', 'Romance', 1997, 7.8, 195),
('Inception', 'Sci-Fi', 2010, 8.8, 148),
('Avatar', 'Sci-Fi', 2009, 7.8, 162),
('Jaws', 'Thriller', 1975, 8.0, 124),
('Frozen', 'Animation', 2013, 7.4, 102),
('Casino', 'Crime', 1995, 8.2, 178),
('Madagascar', 'Animation', 2005, 6.9, 86),
('Shutter', 'Horror', 2004, 7.1, 85),
('Braveheart', 'Action', 1995, 8.3, 178),
('Gladiator', 'Action', 2000, 8.5, 155),
('Interstellar', 'Sci-Fi', 2014, 8.6, 169),
('Saw', 'Horror', 2004, 7.6, 103),
('Memento', 'Thriller', 2000, 8.4, 113),
('Trolls', 'Animation', 2016, 6.5, 92);

INSERT INTO ratings (user_id, movie_id, rating) 
VALUES 
(1, 1, 9.0),
(2, 2, 8.5),
(3, 3, 9.5),
(4, 4, 8.2),
(5, 5, 7.8),
(1, 6, 8.0),
(2, 7, 8.9),
(3, 8, 7.5),
(4, 9, 8.8),
(5, 10, 7.6),
(1, 11, 8.7),
(2, 12, 8.1),
(3, 13, 9.0),
(4, 14, 7.4),
(5, 15, 6.9);

INSERT INTO watch_history (user_id, movie_id, watched_at) 
VALUES 
(1, 1, '2025-03-15 20:00:00'),
(2, 2, '2025-03-15 22:00:00'),
(3, 3, '2025-03-14 19:00:00'),
(4, 4, '2025-03-14 21:00:00'),
(5, 5, '2025-03-13 18:30:00'),
(1, 6, '2025-03-12 17:30:00'),
(2, 7, '2025-03-11 20:15:00'),
(3, 8, '2025-03-10 19:45:00'),
(4, 9, '2025-03-09 21:00:00'),
(5, 10, '2025-03-08 22:10:00'),
(1, 11, '2025-03-07 18:30:00'),
(2, 12, '2025-03-06 20:00:00'),
(3, 13, '2025-03-05 19:00:00'),
(4, 14, '2025-03-04 21:30:00'),
(5, 15, '2025-03-03 22:00:00');
