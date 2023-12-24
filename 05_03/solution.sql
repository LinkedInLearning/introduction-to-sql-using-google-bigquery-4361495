/* ==========================
    Chapter 5 - Movie 3
    Cumulative Metrics
  ===========================

------------------------
  Live BigQuery Example
------------------------ */

-- What is the monthly cumulative sales in 2022?

WITH cte_monthly_sales AS (
SELECT
  DATE_TRUNC(transaction_date, MONTH) AS month_start,
  SUM(total_amount) AS monthly_sales
FROM `wisdom_pets.sales`
WHERE transaction_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY month_start
)
SELECT
  month_start,
  monthly_sales,
  SUM(monthly_sales) OVER (
    ORDER BY month_start
  ) AS monthly_cumulative_sales
FROM cte_monthly_sales
ORDER BY month_start;