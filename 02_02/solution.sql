/* ======================
    Chapter 2 - Movie 2
    Order By Clause
  =======================

-----------------------------------
  Slide Examples BigQuery Example
----------------------------------- */

-- Inspect product ID, name & prices
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`;

-- Sort products from low to high prices
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
ORDER BY retail_price;

-- Sort products from high to low prices
SELECT
  product_id,
  product_name,
  retail_price
FROM `wisdom_pets.products`
ORDER BY retail_price DESC;

-- Sort category products from high to low
-- also known as a multi-level sort
SELECT
 product_id,
  product_name,
  category_name,
  retail_price
FROM `wisdom_pets.products`
ORDER BY
  category_name,
  retail_price DESC;

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- Which products from each category have the highest discount?
SELECT
  product_id,
  product_name,
  category_name,
  retail_price,
  wholesale_discount_percentage
FROM `wisdom_pets.products`
ORDER BY
  category_name,
  wholesale_discount_percentage DESC;