/* ==========================
    Chapter 4 - Movie 3
    Left Join
  ===========================

------------------------
  Live BigQuery Example
------------------------ */

-- What is the total sales for retail vs wholesale customers?
-- Are there any transactions from unregistered customers?

SELECT
  CASE
    WHEN customers.business_name IS NULL
      THEN 'Retail'
    WHEN customers.business_name IS NOT NULL
      THEN 'Wholesale'
    ELSE NULL
  END AS customer_type,
  CASE
    WHEN customers.customer_id IS NULL
      THEN 'Unregistered'
    WHEN customers.customer_id IS NOT NULL
      THEN 'Registered'
    ELSE NULL
  END AS registration_status,
  SUM(sales.total_sales) AS total_sales
FROM `wisdom_pets.sales` AS sales
LEFT JOIN `wisdom_pets.customers` AS customers
  ON sales.customer_id = customers.customer_id
GROUP BY
  customer_type,
  registration_status;
