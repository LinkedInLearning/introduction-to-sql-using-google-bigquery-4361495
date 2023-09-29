/* ==========================
    Chapter 2 - Movie 4
    IN and BETWEEN Operators
  ===========================

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- Products less than $6
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE retail_price < 6
ORDER BY retail_price DESC;

-- Products less than or equal to $6
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE retail_price <= 6
ORDER BY retail_price DESC;

-- Products greater than $55
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE retail_price > 55
ORDER BY retail_price DESC;

-- Products greater than or equal to $55
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE retail_price >= 55
ORDER BY retail_price DESC;

-- Products between $15 and $65
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE retail_price BETWEEN 15 AND 65
ORDER BY retail_price;

-- Putting the larger value first
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE retail_price BETWEEN 65 AND 15
ORDER BY retail_price;

-- Products not between $0 and $75
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE retail_price NOT BETWEEN 0 and 75
ORDER BY retail_price;

-- Products with specific product IDs
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_id IN (100013, 100041, 100051)
ORDER BY product_id;

-- Products with specific product names
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
WHERE product_name IN (
  'Strong Joints Cat Supplement',
  'Strong Joints Dog Supplement'
);

-- Products not in care and supplements
SELECT
  product_id,
  product_name,
  category_name,
  retail_price
FROM `wisdom_pets.products`
WHERE category_name NOT IN (
  'Care',
  'Supplement'
)
ORDER BY category_name;

/* ---------------------
  Live BigQuery Example
------------------------ */

-- Which Care products have a wholesale discount percentage between 20 and 30%?
SELECT
  product_id,
  product_name,
  retail_price,
  category_name,
  wholesale_discount_percentage
FROM `wisdom_pets.products`
WHERE
  category_name = 'Care'
  AND wholesale_discount_percentage BETWEEN 20 AND 30;