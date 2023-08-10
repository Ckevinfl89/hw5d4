--Week 5 - Thursday Questions
--
--1. Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating

CREATE OR REPLACE PROCEDURE add_new_film (
	title VARCHAR,
	description TEXT,
	release_year YEAR,
	language_id INTEGER,
	rental_duration INTEGER,
	rental_rate NUMERIC(4,2),
	length INTEGER,
	replacement_cost NUMERIC(5,2),
	rating mpaa_rating
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;

CALL add_new_film ('DRAGON', 'BALL', 2023, 1, 10, 4.99, 5, 150, mpaa_rating 'PG-13');

SELECT *
FROM film f WHERE title LIKE 'D%'
ORDER BY  title DESC;



--
--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category


CREATE OR REPLACE FUNCTION get_film_count(category_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
as $$
    DECLARE film_count INTEGER;
 BEGIN
    SELECT COUNT(*) INTO film_count
    FROM film_category fc
--    JOIN category c
--    ON fc.category_id = c.catergory_id
    WHERE fc.category_id = get_film_count.category_id;
    RETURN film_count;
END;
$$;

SELECT get_film_count(1);
