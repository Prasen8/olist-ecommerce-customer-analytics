USE ecommerce_analytics1;

-- 1 Total Unique Customers
SELECT COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers;

-- 2 Customers by State
SELECT customer_state,
       COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- 3 Top 10 Customer Cities
SELECT customer_city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

-- 4 Repeat Customers
SELECT c.customer_unique_id,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

-- 5 Average Orders Per Customer
SELECT ROUND(
COUNT(o.order_id) * 1.0 /
COUNT(DISTINCT c.customer_unique_id),2
) AS avg_orders_per_customer
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- 6 Top 20 Customers by Orders
SELECT c.customer_unique_id,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 20;

-- 7 New Customers by Year
SELECT YEAR(o.order_purchase_timestamp) AS year,
       COUNT(DISTINCT c.customer_unique_id) AS new_customers
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY YEAR(o.order_purchase_timestamp)
ORDER BY year;

-- 8 Customers by Zip Prefix
SELECT customer_zip_code_prefix,
       COUNT(*) AS total_customers
FROM customers
GROUP BY customer_zip_code_prefix
ORDER BY total_customers DESC
LIMIT 20;

-- 9 Customer State Contribution %
SELECT customer_state,
       ROUND(
       COUNT(*) * 100.0 /
       (SELECT COUNT(*) FROM customers),2
       ) AS contribution_pct
FROM customers
GROUP BY customer_state
ORDER BY contribution_pct DESC;

-- 10 Customers with Highest Spending
SELECT c.customer_unique_id,
       ROUND(SUM(p.payment_value),2) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 20;