USE ecommerce_analytics1;

-- 1 Total Revenue
SELECT ROUND(SUM(payment_value),2) AS total_revenue
FROM payments;

-- 2 Average Order Value
SELECT ROUND(AVG(payment_value),2) AS avg_order_value
FROM payments;

-- 3 Monthly Revenue Trend
SELECT DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
       ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN payments p ON o.order_id=p.order_id
GROUP BY month
ORDER BY month;

-- 4 Monthly Order Trend
SELECT DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS month,
       COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- 5 Revenue by Year
SELECT YEAR(o.order_purchase_timestamp) AS year,
       ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN payments p ON o.order_id=p.order_id
GROUP BY year;

-- 6 Orders by Status
SELECT order_status,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- 7 Revenue by Payment Type
SELECT payment_type,
       ROUND(SUM(payment_value),2) AS revenue
FROM payments
GROUP BY payment_type
ORDER BY revenue DESC;

-- 8 Average Payment Installments
SELECT ROUND(AVG(payment_installments),2)
AS avg_installments
FROM payments;

-- 9 Top Revenue Months
SELECT DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
       ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN payments p ON o.order_id=p.order_id
GROUP BY month
ORDER BY revenue DESC
LIMIT 10;

-- 10 Revenue by State
SELECT c.customer_state,
       ROUND(SUM(p.payment_value),2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
JOIN payments p ON o.order_id=p.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;