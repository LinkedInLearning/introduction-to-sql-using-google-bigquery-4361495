/* ==========================
    Chapter 3 - Movie 2
    Case When Statements
  ===========================

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- Assign a segment name for cat/dog products
SELECT
    product_id,
    product_name,
    CASE
        WHEN product_name LIKE '%Cat%' THEN 'Cat'
        WHEN product_name LIKE '%Dog%' THEN 'Dog'
        ELSE 'Other'
    END AS segment_name
FROM `wisdom_pets.products`
ORDER BY segment_name;

-- This ELSE condition is not compulsory
SELECT
    product_id,
    product_name,
    CASE
        WHEN product_name LIKE '%Cat%' THEN 'Cat'
        WHEN product_name LIKE '%Dog%' THEN 'Dog'
        ELSE 'Other'
    END AS segment_name
FROM `wisdom_pets.products`
ORDER BY segment_name;

-- Returns NULL when other conditions not met
SELECT
    product_id,
    product_name,
    CASE
        WHEN product_name LIKE '%Cat%' THEN 'Cat'
        WHEN product_name LIKE '%Dog%' THEN 'Dog'
   END AS segment_name
FROM `wisdom_pets.products`
ORDER BY segment_name NULLS LAST;

-- How many products for each segment?
SELECT
    CASE
        WHEN product_name LIKE '%Cat%' THEN 'Cat'
        WHEN product_name LIKE '%Dog%' THEN 'Dog'
        ELSE 'Other'
    END AS segment_name,
    COUNT(*) AS product_count
FROM `wisdom_pets.products`
GROUP BY segment_name
ORDER BY segment_name;

/* ---------------------
  Live BigQuery Example
------------------------

--------------------------------------------------
How many products are between the price bands of:
  $1 to $5
  $5 to $10
  $10 to $25
  $25 +
-------------------------------------------------- */
SELECT
  CASE
    WHEN retail_price BETWEEN 1 AND 5
      THEN '$1 to $5'
    WHEN retail_price > 5 AND retail_price <= 10
      THEN '$5 to $10'
    WHEN retail_price > 10 AND retail_price <= 25
      THEN '$10 to $25'
    WHEN retail_price > 25
      THEN '$25 +'
    ELSE NULL
  END AS price_band,
  COUNT(*) AS product_count
FROM `wisdom_pets.products`
GROUP BY price_band;
