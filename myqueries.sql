-----------------------------------------------------------------------------------------
--Only used for COMP6240 students in S2 2022
--Please enter your SQL queries to Question 1.1-1.10 
--Please input your UID here: U7444134
------------------------------------------------------------------------------------------

-- Q1.1

SELECT id AS person_with_Z FROM person WHERE first_name LIKE 'Z%';







-- Q1.2

SELECT DISTINCT COUNT(title) AS count_k_14 FROM restriction WHERE upper(description) = 'K-14';







-- Q1.3


SELECT DISTINCT count(w.id) FROM writer AS w INNER JOIN person AS p ON w.id = p.id WHERE year_born >= 1930;







-- Q1.4

SELECT DISTINCT country, count(*) FROM restriction_category GROUP BY country ORDER BY count DESC;








-- Q1.5



SELECT count(d.id) FROM (SELECT DISTINCT a.id FROM director AS a INNER JOIN movie AS b ON a.title = b.title WHERE major_genre != 'romance') AS d;






-- Q1.6



WITH p AS (SELECT DISTINCT ROUND(100.0*(SELECT count(country) FROM movie WHERE lower(country) = 'australia')/(SELECT count(country) FROM movie),2) AS percentage FROM movie)
SELECT ROUND(percentage/100,2) AS percent FROM p;


-- Q1.7



WITH award AS (SELECT title,production_year, count(year_of_award) AS ans from crew_award WHERE lower(result) = 'won' GROUP BY title,production_year) 
SELECT title,production_year FROM award WHERE ans = (SELECT MAX(ans) FROM award);





-- Q1.8


WITH one AS (SELECT title,result FROM movie_award
UNION ALL
SELECT title,result FROM crew_award
UNION ALL
SELECT title,result FROM director_award
UNION ALL
SELECT title,result FROM actor_award
UNION ALL
SELECT  title,result FROM writer_award),
two AS (SELECT title,result FROM movie_award WHERE lower(result) = 'won'
UNION ALL
SELECT title,result FROM crew_award WHERE lower(result) = 'won'
UNION ALL
SELECT title,result FROM director_award WHERE lower(result) = 'won'
UNION ALL
SELECT title,result FROM actor_award WHERE lower(result) = 'won'
UNION ALL
SELECT  title,result FROM writer_award WHERE lower(result) = 'won'),
three AS (SELECT title FROM one
EXCEPT
SELECT title FROM two ORDER BY title)
SELECT COUNT(title) FROM three; 




-- Q1.9


WITH a AS (SELECT * FROM director INNER JOIN movie ON director.title = movie.title),
b AS (SELECT id, COUNT(major_genre) AS dis_type FROM a GROUP BY id,major_genre),
c AS (SELECT id, COUNT(dis_type) AS ans FROM b GROUP BY id)
SELECT id FROM c WHERE ans = (SELECT MAX(ans) FROM c);







-- Q1.10



WITH a AS (SELECT title,production_year FROM writer GROUP BY title, production_year Having COUNT(title) > 1),
b AS (SELECT * FROM a LEFT JOIN writer ON a.title = writer.title),
c AS (SELECT p.id, p.first_name, p.last_name FROM person AS p INNER JOIN b ON p.id = b.id)
SELECT DISTINCT id,first_name,last_name FROM c ORDER BY last_name ASC;










----------------------------------------------------------------
-- End of your answers
-----------------------------------------------------------------
