USE ecommerce_analytics1;

-- 1 Total Sellers
SELECT COUNT(*) AS total_sellers
FROM sellers;

-- 2 Sellers by State
SELECT seller_state,
       COUNT(*) total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;

-- 3 Top Sellers by Revenue
SELECT seller_id,
       ROUND(SUM(price),2) revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;

-- 4 Bottom Sellers by Revenue
SELECT seller_id,
       ROUND(SUM(price),2) revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue ASC
LIMIT 10;

-- 5 Average Seller Revenue
SELECT ROUND(
SUM(price)/COUNT(DISTINCT seller_id),2
) avg_revenue
FROM order_items;

-- 6 Sellers with Most Orders
SELECT seller_id,
       COUNT(DISTINCT order_id) total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC
LIMIT 10;

-- 7 Top Seller Cities
SELECT seller_city,
       COUNT(*) total_sellers
FROM sellers
GROUP BY seller_city
ORDER BY total_sellers DESC
LIMIT 10;

-- 8 Revenue by Seller State
SELECT s.seller_state,
       ROUND(SUM(oi.price),2) revenue
FROM sellers s
JOIN order_items oi
ON s.seller_id=oi.seller_id
GROUP BY s.seller_state
ORDER BY revenue DESC;

-- 9 Average Order Value by Seller
SELECT seller_id,
       ROUND(AVG(price),2) avg_order_value
FROM order_items
GROUP BY seller_id
ORDER BY avg_order_value DESC;

-- 10 Seller Contribution %
SELECT seller_id,
       ROUND(
       SUM(price)*100/
       (SELECT SUM(price) FROM order_items),2
       ) contribution_pct
FROM order_items
GROUP BY seller_id
ORDER BY contribution_pct DESC
LIMIT 20;