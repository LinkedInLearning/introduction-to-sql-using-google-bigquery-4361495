/* ==========================
    Chapter 2 - Movie 7
    Calculation Functions
  ===========================

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- What is the price range of all products?
SELECT
    MIN(retail_price) AS minimum_price,
    MAX(retail_price) AS maximum_price
FROM `wisdom_pets.products`;

-- What is the average wholesale discount %?
SELECT
    AVG(wholesale_discount_percentage) AS avg_discount
FROM `wisdom_pets.products`;

-- Rounded 2dp average wholesale discount %
SELECT
  ROUND(
    AVG(wholesale_discount_percentage),
    2
  ) AS rounded_avg_discount
FROM `wisdom_pets.products`;

-- Top 5 products by wholesale price
SELECT
  product_id,
  product_name,
  retail_price,
  wholesale_discount_percentage,
  ROUND(
    retail_price * (
      1 - wholesale_discount_percentage / 100
    ),
    2
  ) AS wholesale_price
FROM `wisdom_pets.products`
ORDER BY wholesale_price DESC
LIMIT 5;

-- Calculate Supplement category summary statistics
SELECT
    AVG(retail_price) AS average_retail_price,
    STDDEV(retail_price) AS stddev_retail_price,
    COUNT(DISTINCT product_id) AS unique_product_count,
    AVG(rating) AS average_rating
FROM `wisdom_pets.products`
WHERE category_name = 'Supplement';

/* ---------------------
  Live BigQuery Example
------------------------ */

-- What is the average and standard deviation of the retail price for all Wisdom Pets products?
SELECT
  ROUND(
    AVG(retail_price),
    2
  ) AS average_retail_price,
  ROUND(
    STDDEV(retail_price),
    2
  ) AS std_retail_price
FROM `wisdom_pets.products`;
