-- Recommend movies based on ratings
CALL GetTopRatedMovies();

--  Recommend movies based on genre 
CALL GetMoviesByGenre('Action');

-- Recommend movies by genre that are highly rated
CALL GetHighlyRatedMoviesByGenre();

-- Average rating of movies in each genre 
CALL GetAverageRatingByGenre();

-- Trending movies  
CALL GetTrendingMovies();

-- Recommend movies that are rated by the most number of users 
CALL GetMoviesRatedByMostUsers();



