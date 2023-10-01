/* ==========================
    Chapter 3 - Challenge
    Wisdom Pets Quiz 2
  =========================== */

-- Question 1
-- Which top 3 product IDs are the best selling based off the total_amount field?

SELECT
  product_id,
  SUM(total_amount) AS total_sales
FROM `wisdom_pets.sales`
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 3;

-- Question 2
-- What is the total sales and percentage breakdown by transaction_type?

WITH cte_base_data AS (
SELECT
  transaction_type,
  SUM(total_amount) AS total_sales,
  SUM(SUM(total_amount)) OVER () AS overall_sales
FROM `wisdom_pets.sales`
GROUP BY transaction_type
)
SELECT
  transaction_type,
  total_sales,
  ROUND(
    total_sales / overall_sales,
    2
  ) AS percentage_breakdown
FROM cte_base_data;