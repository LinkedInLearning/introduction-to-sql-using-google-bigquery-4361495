/* ==========================
    Chapter 2 - Movie 5
    Fuzzy String Matching
  ===========================

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- Which products contain the word "Dog"?
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name LIKE '%Dog%';

-- This matches products starting with Dog
-- This query will return 0 records
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name LIKE 'Dog%';

-- This matches products ending with Dog
-- This query will return 0 records
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name LIKE '%Dog';

-- This is exactly matching Dog only
-- This query will return 0 records
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name LIKE 'Dog';

-- Case sensitivity matters for LIKE
-- This query will return 0 records
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name LIKE '%dog%';

-- We can use UPPER and use all capitals
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE UPPER(product_name) LIKE '%DOG%';

-- We can use LOWER and use all lowercase
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE LOWER(product_name) LIKE '%dog%';

-- We can use LIKE ANY similar to IN
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name LIKE ANY ('%Dog%', '%Cat%');

/* ---------------------
  Live BigQuery Example
------------------------ */

-- Find all the products which have “Teeth” or “Tooth” and any “Coat” related products
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name LIKE ANY ('%Teeth%', '%Tooth%', '%Coat%');