/* ==========================
    Chapter 2 - Challenge
    Wisdom Pets Quiz 1
  =========================== */

-- Question 1
-- Show top products with ID, name, retail price and category.
-- Sort output from lowest to highest price.
SELECT
  product_id,
  product_name,
  retail_price,
  category_name
FROM `wisdom_pets.products`
ORDER BY retail_price;

-- Question 2
-- How many dog supplement products are available?
-- Show average retail price and rating rounded to nearest 2 decimal places.
SELECT
  COUNT(*) AS product_count,
  ROUND(
    AVG(retail_price),
    2
  ) AS avg_retail_price,
  ROUND(
    AVG(rating),
    2
  ) AS avg_rating
FROM `wisdom_pets.products`
WHERE
  category_name = 'Supplement'
  AND product_name LIKE '%Dog%';


-- Question 3
-- Calculate wholesale price using the discount percentage.
-- Sort output from highest discount amount to lowest.

SELECT
  product_id,
  product_name,
  retail_price,
  wholesale_discount_percentage,
  retail_price * (
    1 - wholesale_discount_percentage / 100
  ) AS wholesale_price,
  retail_price * ( wholesale_discount_percentage / 100 ) AS discount_amount
FROM `wisdom_pets.products`
ORDER BY discount_amount DESC;