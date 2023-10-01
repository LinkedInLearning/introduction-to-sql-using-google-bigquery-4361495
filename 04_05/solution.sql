/* ==========================
    Chapter 4 - Challenge
    Wisdom Pets Quiz 3
  =========================== */

-- Question 1
-- What is the average transaction size for wholesale and retail transaction types split by customer VIP status?

WITH cte_transaction_size AS (
SELECT
  sales.transaction_type,
  sales.transaction_id,
  customers.vip_customer_flag,
  SUM(sales.total_amount) AS transaction_size
FROM `wisdom_pets.sales` AS sales
INNER JOIN `wisdom_pets.customer` AS customers
  ON sales.customer_id = customers.customer_id
GROUP BY
  sales.transaction_type,
  sales.transaction_id,
  customers.customer_vip_flag
)
SELECT
  transaction_type,
  vip_customer_flag,
  AVG(transaction_size) AS avg_transaction_size
FROM cte_transaction_size
GROUP BY
  transaction_type,
  vip_customer_flag;

-- Question 2
-- What is the total discount amount for all wholesale transactions?

WITH cte_product_discount AS (
SELECT
  sales.product_id,
  sales.quantity,
  products.retail_price * ( products.wholesale_discount_percentage / 100 ) AS discount_amount_per_unit
FROM `wisdom_pets.sales` AS sales
INNER JOIN `wisdom_pets.products` AS products
  ON sales.product_id = products.product_id
WHERE transaction_type = 'Wholesale'
)
SELECT
  SUM(quantity * discount_amount_per_unit) AS total_discount_amount
FROM cte_product_discount;