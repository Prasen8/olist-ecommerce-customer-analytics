USE ecommerce_analytics1;

-- KPI 1 Total Revenue
SELECT ROUND(SUM(payment_value),2) total_revenue FROM payments;

-- KPI 2 Total Orders
SELECT COUNT(*) total_orders FROM orders;

-- KPI 3 Total Customers
SELECT COUNT(DISTINCT customer_unique_id) total_customers FROM customers;

-- KPI 4 Total Sellers
SELECT COUNT(*) total_sellers FROM sellers;

-- KPI 5 Total Products
SELECT COUNT(*) total_products FROM products;

-- KPI 6 Average Order Value
SELECT ROUND(AVG(payment_value),2) avg_order_value FROM payments;

-- KPI 7 Average Review Score
SELECT ROUND(AVG(review_score),2) avg_review_score FROM reviews;

-- KPI 8 Delivered Orders %
SELECT ROUND(
100*SUM(CASE WHEN order_status='delivered' THEN 1 ELSE 0 END)
/COUNT(*),2)
AS delivered_percentage
FROM orders;

-- KPI 9 Repeat Customer %
SELECT ROUND(
COUNT(DISTINCT customer_id)*100/
(SELECT COUNT(*) FROM customers),2)
FROM orders;

-- KPI 10 Top Revenue Category
SELECT p.product_category_name,
       ROUND(SUM(oi.price),2) revenue
FROM order_items oi
JOIN products p
ON oi.product_id=p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 1; 