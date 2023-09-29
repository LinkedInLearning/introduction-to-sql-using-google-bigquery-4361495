/* ==========================
    Chapter 2 - Movie 6
    Count Function
  ===========================

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- How many rows in the products table?
SELECT COUNT(*)
FROM `wisdom_pets.products`;

-- How many rows in the products table?
-- We use an alias to rename the COUNT(*) output
SELECT
  COUNT(*) AS row_count
FROM `wisdom_pets.products`;

-- Count non-null rating values
SELECT
  COUNT(rating) AS rating_count
FROM `wisdom_pets.products`;

-- Check NULL records for rating
SELECT
  product_id,
  product_name,
  rating
FROM `wisdom_pets.products`
WHERE rating IS NULL;

-- How many unique rating values are there?
SELECT
  COUNT(DISTINCT rating) AS unique_ratings
FROM `wisdom_pets.products`;

-- COUNT DISTINCT ignores NULLs
SELECT
  product_id,
  product_name,
  rating
FROM `wisdom_pets.products`
ORDER BY rating;

-- Multiple COUNT functions are also possible
SELECT
    COUNT(*) AS record_count,
    COUNT(rating) AS rating_count,
    COUNT(DISTINCT category_name) AS unique_category_count,
    COUNT(DISTINCT rating) AS unique_rating_count
FROM `wisdom_pets.products`;

-- COUNT functions can also be used with WHERE clause
SELECT
    COUNT(*) AS record_count,
    COUNT(rating) AS rating_count,
    COUNT(DISTINCT category_name) AS unique_category_count,
    COUNT(DISTINCT rating) AS unique_rating_count
FROM `wisdom_pets.products`
WHERE retail_price <= 6;

-- WHERE clause is executed first
-- Then COUNT functions are performed
-- This is used to show the SQL order of operations
SELECT *
FROM `wisdom_pets.products`
WHERE retail_price <= 6;

/* ---------------------
  Live BigQuery Example
------------------------ */

-- How many products are in the Care category with a price less than $9?
SELECT
  COUNT(*) AS product_counts
FROM `wisdom_pets.products`
WHERE
  category_name = 'Care'
  AND retail_price < 9;