/* ==========================
    Chapter 3 - Movie 1
    Group By Clause
  ===========================

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- Count the rows for each category name
SELECT
    category_name,
    COUNT(*) AS record_count
FROM `wisdom_pets.products`
GROUP BY category_name
ORDER BY category_name;

-- Apply multiple calculation functions
SELECT
    category_name,
    COUNT(*) AS record_count,
    AVG(retail_price) AS average_retail_price,
    MAX(rating) AS max_rating
FROM `wisdom_pets.products`
GROUP BY category_name
ORDER BY category_name;

-- Use HAVING to filter our GROUP BY outputs
SELECT
    category_name,
    COUNT(*) AS record_count,
    AVG(retail_price) AS average_retail_price,
    MAX(rating) AS max_rating
FROM `wisdom_pets.products`
GROUP BY category_name
HAVING average_retail_price < 10
ORDER BY category_name;

-- Count category products below $10
SELECT
    category_name,
    COUNT(*) AS record_count
FROM `wisdom_pets.products`
WHERE retail_price < 10
GROUP BY category_name
ORDER BY category_name;

-- Count products by category and discount levels
SELECT
    category_name,
    wholesale_discount_percentage,
    COUNT(*) AS record_count
FROM `wisdom_pets.products`
GROUP BY
  category_name,
  wholesale_discount_percentage
ORDER BY
  category_name,
  wholesale_discount_percentage;

/* ---------------------
  Live BigQuery Example
------------------------ */

-- How many products in each category have a rating greater than or equal to 4.5?
SELECT
  category_name,
  COUNT(*) AS product_count
FROM `wisdom_pets.products`
WHERE rating >= 4.5
GROUP BY category_name;