/* ======================
    Chapter 2 - Movie 2
    Order By Clause
  =======================

-------------------------
  Live BigQuery Examples
------------------------- */

-- Show all rows and columns from the products table
-- Include the unique GCP project ID in the query
SELECT * FROM `intro-to-bq.wisdom_pets.products`;

-- The shortened form without the project ID
SELECT * FROM `wisdom_pets.products`;

-- Only include product_id and product_name columns
SELECT
  product_id,
  product_name
FROM `wisdom_pets.products`;