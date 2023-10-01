/* ==========================
    Chapter 5 - Challenge
    Wisdom Pets Quiz 4
  =========================== */

-- Question 1
-- What is the most purchased item for each customer?
-- How many units and what was the total amount for their historic top item purchase?

WITH cte_customer_product_sales AS (
SELECT
  customer_id,
  product_id,
  SUM(quantity) AS total_units,
  SUM(total_amount) AS total_sales
FROM `wisdom_pets.sales`
GROUP BY
  customer_id,
  product_id
)
SELECT
  customer_id,
  product_id,
  total_units,
  total_sales,
FROM cte_customer_product_sales
QUALIFY RANK() OVER (
  PARTITION BY customer_id
  ORDER BY total_units DESC
) = 1
ORDER BY customer_id;

-- Question 2
-- When was the last purchase made by each customer?
-- What was their 30 day moving total spend on this date?

WITH cte_customer_daily_sales AS (
SELECT
  customer_id,
  transaction_date,
  SUM(total_amount) AS daily_sales
FROM `wisdom_pets.sales`
GROUP BY
  customer_id,
  transaction_date
)
SELECT
  customer_id,
  transaction_date,
  SUM(daily_sales) OVER (
    PARTITION BY customer_id
    ORDER BY UNIX_DATE(transaction_date)
    RANGE BETWEEN 29 PRECEDING AND CURRENT ROW
  ) AS total_sales_moving_avg_30_days
FROM cte_customer_daily_sales
QUALIFY RANK() OVER (
  PARTITION BY customer_id
  ORDER BY transaction_date DESC
) = 1;