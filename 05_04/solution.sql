/* ==========================
    Chapter 5 - Movie 4
    Moving Averages
  ===========================

------------------------
  Live BigQuery Example
------------------------ */

-- What is the latest 7 and 28 day moving average of daily sales for wholesale and retail transactions?

WITH cte_daily_sales AS (
SELECT
  transaction_type,
  transaction_date,
  SUM(total_amount) AS daily_sales
FROM `wisdom_pets.sales`
GROUP BY
  transaction_type,
  transaction_date
)
SELECT
  transaction_type,
  AVG(daily_sales) OVER (
    PARTITION BY transaction_type,
    ORDER BY UNIX_DATE(transaction_date)
    RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS sales_7_day_moving_average,
  AVG(daily_sales) OVER (
    PARTITION BY transaction_type,
    ORDER BY UNIX_DATE(transaction_date)
    RANGE BETWEEN 27 PRECEDING AND CURRENT ROW
  ) AS sales_28_day_moving_average
FROM cte_daily_sales
QUALIFY RANK() OVER (ORDER BY transaction_date DESC) = 1;