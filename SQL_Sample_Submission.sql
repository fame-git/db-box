-----------------------------------------------------------------------------------------

--Please refer to the sample solutions to Questions 1.1-1.15 

--Please input your UID here: U1234567

-- This is the sample file that you should submit to Wattle.

------------------------------------------------------------------------------------------



-- Q1.1





SELECT title, production_year
FROM movie
WHERE lower(country) = 'australia';



-- Q1.2


SELECT count(id)
FROM person;


-- Q1.3


SELECT w.id, first_name, last_name, award_name
FROM writer_award AS w INNER JOIN person AS p
ON w.id = p.id
WHERE year_of_award = 1994 AND lower(result) = 'won';


-- Q1.4


SELECT d.id, m.title, m.production_year
FROM director d NATURAL JOIN movie m
WHERE m.major_genre = 'crime';


-- Q1.5


SELECT COUNT(DISTINCT id)
FROM crew
WHERE production_year = 1993;


-- Q1.6



SELECT MAX(year_born)
FROM person NATURAL JOIN director;



-- Q1.7



SELECT id, first_name, last_name
FROM writer NATURAL JOIN movie NATURAL JOIN person
WHERE lower(country) = 'usa'
GROUP BY id, first_name, last_name
HAVING COUNT(*) = 2
ORDER BY id ASC;



-- Q1.8


SELECT COUNT(*)
FROM (SELECT id
      FROM director
      EXCEPT
      SELECT id
      FROM writer) AS dnw;


-- Q1.9


WITH MovieSceneNum AS (SELECT COUNT(*) AS SceneNum
                       FROM scene
                       GROUP BY title, production_year)
SELECT MAX(SceneNum)
FROM MovieSceneNum;


-- Q1.10


SELECT DISTINCT wd.id
FROM writer_award wd
WHERE wd.year_of_award = (SELECT MAX(year_of_award)
                          FROM writer_award
                          WHERE lower(result)='won');


-- Q1.11


SELECT title, production_year
FROM movie_award
WHERE lower(result) = 'won'
GROUP BY title, production_year
HAVING count(*) = 2;


-- Q1.12


SELECT w1.id, w1.title, w1.production_year
FROM writer_award w1
WHERE lower(w1.result) = 'won'
INTERSECT
SELECT d1.id, d1.title, d1.production_year
FROM director_award da NATURAL JOIN director AS d1
WHERE lower(da.result) = 'won';


-- Q1.13



SELECT id, first_name, last_name
FROM person
WHERE id IN (SELECT id
             FROM actor_award natural join role
             WHERE lower(result) <> 'won'
             GROUP BY id
             HAVING count(*) > 1
             EXCEPT
             SELECT id
             FROM actor_award NATURAL JOIN role
             WHERE lower(result) = 'won')
ORDER BY last_name ASC;


-- Q1.14


WITH movie_wins AS (SELECT title, production_year, COUNT(*) AS wins
                    FROM movie_award
                    WHERE lower(result) = 'won'
                    GROUP BY title, production_year)
SELECT DISTINCT id
FROM crew c NATURAL JOIN movie_wins
WHERE wins = (SELECT MAX(wins)
              FROM movie_wins);


-- Q1.15

WITH DirectorNum AS (SELECT id, COUNT(*) AS num
                     FROM director
                     GROUP BY id)
SELECT id
FROM DirectorNum dn
WHERE dn.num = (SELECT MAX(num)
                FROM DirectorNum);




----------------------------------------------------------------

-- End of your answers

-----------------------------------------------------------------
