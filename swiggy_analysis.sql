CREATE DATABASE swiggy_analysis;
USE swiggy_analysis;

CREATE TABLE swiggy (
    id INT,
    name VARCHAR(255),
    city VARCHAR(100),
    rating VARCHAR(20),
    rating_count VARCHAR(50),
    cost VARCHAR(50),
    cuisine VARCHAR(500),
    lic_no VARCHAR(100),
    link VARCHAR(500),
    address VARCHAR(500),
    menu VARCHAR(500)
);








SELECT
    city,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(rating_numeric), 2) AS average_rating
FROM swiggy
WHERE rating_numeric IS NOT NULL
GROUP BY city
HAVING COUNT(rating_numeric) >= 50
ORDER BY restaurant_count DESC
LIMIT 10;

SELECT
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS null_names,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_city,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_ratings,
    SUM(CASE WHEN rating_count IS NULL THEN 1 ELSE 0 END) AS null_rating_count,
    SUM(CASE WHEN cost IS NULL THEN 1 ELSE 0 END) AS null_cost,
    SUM(CASE WHEN cuisine IS NULL THEN 1 ELSE 0 END) AS null_cuisine
FROM swiggy;

SELECT rating, COUNT(*) AS total
FROM swiggy
GROUP BY rating
ORDER BY total DESC;

SELECT rating, rating_numeric
FROM swiggy
LIMIT 20;

SELECT city, COUNT(*) AS restaurant_count
FROM swiggy
GROUP BY city
ORDER BY restaurant_count DESC
LIMIT 10;

SELECT cuisine, COUNT(*) AS restaurant_count
FROM swiggy
WHERE cuisine IS NOT NULL
GROUP BY cuisine
ORDER BY restaurant_count DESC
LIMIT 10;
