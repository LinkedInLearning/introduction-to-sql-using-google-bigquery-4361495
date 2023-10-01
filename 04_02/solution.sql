/* ==========================
    Chapter 4 - Movie 2
    Inner Join
  ===========================

------------------------
  Live BigQuery Example
------------------------ */

-- Which products have the most sales?
-- Return the product name, category, sales and quantity

SELECT
  products.product_name,
  products.category_name,
  SUM(sales.total_amount) AS total_sales,
  SUM(sales.quantity) AS total_quantity
FROM `wisdom_pets.sales` AS sales
INNER JOIN `wisdom_pets.products` AS products
  ON sales.product_id = products.product_id
GROUP BY
  products.product_name,
  products.category_name
ORDER BY total_sales DESC;
