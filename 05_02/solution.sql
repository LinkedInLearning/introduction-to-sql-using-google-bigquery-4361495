/* ==========================
    Chapter 5 - Movie 2
    Ranking Functions
  ===========================

------------------------
  Live BigQuery Example
------------------------ */

-- Identify the top 5 customer IDs by sales performance and show their total sales amount

SELECT
  customer_id,
  SUM(total_amount) AS total_sales,
  RANK() OVER (
    ORDER BY SUM(total_amount) DESC
  ) AS sales_rank
FROM `wisdom_pets.sales`
GROUP BY customer_id
QUALIFY sales_rank <= 5
ORDER BY sales_rank;