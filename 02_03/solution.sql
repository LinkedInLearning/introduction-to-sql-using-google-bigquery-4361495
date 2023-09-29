/* ======================
    Chapter 2 - Movie 3
    Where Clause 
  =======================

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- Which products are exactly $100?
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE retail_price = 100;

-- Exact string match on product name
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name = 'Medicated Dog Shampoo';

-- Double quotes also work in BigQuery
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name = "Medicated Dog Shampoo";

-- Category not equal to supplement
SELECT
  product_id,
  product_name,
  category_name
FROM `wisdom_pets.products`
WHERE category_name != 'Supplement';

-- != and <> can both be used
SELECT
  product_id,
  product_name,
  category_name
FROM `wisdom_pets.products`
WHERE category_name <> 'Supplement';

/* ---------------------
  Live BigQuery Example
------------------------ */

-- What is the most expensive product in the Care category?
SELECT
  product_id,
  product_name,
  retail_price,
  category_name
FROM `wisdom_pets.products`
WHERE category_name = 'Care'
ORDER BY retail_price DESC;