SELECT title, release_date 
FROM movies WHERE release_date >= '1983%' 
AND release_date <= '1994%' 
ORDER BY release_date DESC;

----------------------------------------------------------------------------
SELECT * FROM(
SELECT DISTINCT movies.id, movies.title, avg(ratings.rating) AS avg_rating
FROM movies
JOIN ratings ON movies.id = ratings.movies.id
GROUP BY movies.id
ORDER BY avg_rating
)
AS min_avg
WHERE avg_rating = 1;

------------------------------------------------------------------------------
SELECT distinct movies.title FROM movies
JOIN genres_movies ON movies.id = genres_movies.movie_id
JOIN ratings ON movies.id = ratings.movie_id
JOIN users ON ratings.user_id = user.id
JOIN occupations ON users.occupation_id = occupations.id
JOIN genres ON genres.id = genres_movies.genre_id
WHERE ratings.rating = 5
AND occupation.name = 'Student'
AND users.gender = 'M'
AND users.age = '24'
AND genres.name = 'Sci-fi'
