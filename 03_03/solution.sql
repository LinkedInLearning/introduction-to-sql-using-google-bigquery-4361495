/* ==========================
    Chapter 3 - Movie 3
    Countif Function
  ===========================

---------------------------
  Lesson BigQuery Examples
--------------------------- */

-- Assign a 1/0 flag for dog products
SELECT
    product_name,
    CASE
        WHEN product_name LIKE '%Dog%'
            THEN 1
        ELSE 0
    END AS dog_product_flag
FROM `wisdom_pets.products`
ORDER BY dog_product_flag DESC;

-- Sum the 1/0 flag for count of dog products
SELECT
    SUM(
        CASE
            WHEN product_name LIKE '%Dog%'
                THEN 1
            ELSE 0
        END
    ) AS dog_product_count
FROM `wisdom_pets.products`;

-- Count dog products for each category
SELECT
    category_name,
    SUM(
        CASE
            WHEN product_name LIKE '%Dog%'
                THEN 1
            ELSE 0
        END
    ) AS dog_product_count
FROM `wisdom_pets.products`
GROUP BY category_name
ORDER BY dog_product_count DESC;

-- COUNTIF dog products for each category
SELECT
    category_name,
    COUNTIF(product_name LIKE '%Dog%') AS dog_product_count
FROM `wisdom_pets.products`
GROUP BY category_name
ORDER BY dog_product_count DESC;

-- Count both Dog and Cat products for each category
SELECT
    category_name,
    COUNTIF(product_name LIKE '%Dog%') AS dog_product_count,
    COUNTIF(product_name LIKE '%Cat%') AS cat_product_count
FROM `wisdom_pets.products`
GROUP BY category_name
ORDER BY category_name;

-- Find avg category rating of Dog & Cat products
SELECT
    category_name,
    AVG(
        CASE
            WHEN product_name LIKE '%Dog%'
                THEN rating
            ELSE NULL
        END
    ) AS avg_dog_rating,
    AVG(
        CASE
            WHEN product_name LIKE '%Cat%'
                THEN rating
            ELSE NULL
        END
    ) AS avg_cat_rating
FROM `wisdom_pets.products`
GROUP BY category_name
ORDER BY category_name;

-- For aggregate calculations, we don’t use a 1/0 flag
SELECT
    category_name,
    AVG(
        CASE
            WHEN product_name LIKE '%Dog%'
                THEN rating
            ELSE NULL
        END
    ) AS avg_dog_rating,
    AVG(
        CASE
            WHEN product_name LIKE '%Cat%'
                THEN rating
            ELSE NULL
        END
    ) AS avg_cat_rating
FROM `wisdom_pets.products`
GROUP BY category_name
ORDER BY category_name;

-- For aggregate calculations, we don’t use a 1/0 flag
SELECT
    category_name,
    AVG(
        CASE
            WHEN product_name LIKE '%Dog%'
                THEN rating
            ELSE NULL
        END
    ) AS avg_dog_rating,
    AVG(
        CASE
            WHEN product_name LIKE '%Cat%'
                THEN rating
            ELSE NULL
        END
    ) AS avg_cat_rating
FROM `wisdom_pets.products`
GROUP BY category_name
ORDER BY category_name;

-- Show category avg rating & count of Dog/Cat products
-- Remove products which have NULL rating from the count
SELECT
    category_name,
    AVG(
        CASE
            WHEN product_name LIKE '%Dog%'
                THEN rating
            ELSE NULL
        END
    ) AS avg_dog_rating,
    AVG(
        CASE
            WHEN product_name LIKE '%Cat%'
                THEN rating
            ELSE NULL
        END
    ) AS avg_cat_rating,
    COUNTIF(product_name LIKE '%Dog%') AS dog_product_count,
    COUNTIF(product_name LIKE '%Cat%') AS cat_product_count
FROM `wisdom_pets.products`
WHERE rating IS NOT NULL
GROUP BY category_name
ORDER BY category_name;

/* ---------------------
  Live BigQuery Example
------------------------

-----------------------------------------------------
For each category - calculate the following metrics:
  How many 5 star dog products are there?
  How many 4 star cat products are there?
----------------------------------------------------- */
SELECT
  category_name,
  COUNTIF(rating = 5 AND product_name LIKE '%Dog%') AS dog_product_5_star,
  COUNTIF(rating = 4 AND product_name LIKE '%Cat%') AS cat_product_4_star
FROM `wisdom_pets.products`
GROUP BY category_name;
