USE ecommerce_analytics1;

-- 1 Total Products
SELECT COUNT(*) AS total_products
FROM products;

-- 2 Top Categories by Product Count
SELECT product_category_name,
       COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC
LIMIT 10;

-- 3 Most Sold Categories
SELECT pr.product_category_name,
       COUNT(*) AS total_sales
FROM order_items oi
JOIN products pr ON oi.product_id=pr.product_id
GROUP BY pr.product_category_name
ORDER BY total_sales DESC
LIMIT 10;

-- 4 Least Sold Categories
SELECT pr.product_category_name,
       COUNT(*) AS total_sales
FROM order_items oi
JOIN products pr ON oi.product_id=pr.product_id
GROUP BY pr.product_category_name
ORDER BY total_sales ASC
LIMIT 10;

-- 5 Average Product Price by Category
SELECT pr.product_category_name,
       ROUND(AVG(oi.price),2) avg_price
FROM order_items oi
JOIN products pr ON oi.product_id=pr.product_id
GROUP BY pr.product_category_name
ORDER BY avg_price DESC;

-- 6 Highest Priced Products
SELECT product_id,
       MAX(price) AS highest_price
FROM order_items
GROUP BY product_id
ORDER BY highest_price DESC
LIMIT 20;

-- 7 Lowest Priced Products
SELECT product_id,
       MIN(price) AS lowest_price
FROM order_items
GROUP BY product_id
ORDER BY lowest_price ASC
LIMIT 20;

-- 8 Product Revenue by Category
SELECT pr.product_category_name,
       ROUND(SUM(oi.price),2) revenue
FROM order_items oi
JOIN products pr ON oi.product_id=pr.product_id
GROUP BY pr.product_category_name
ORDER BY revenue DESC;

-- 9 Top 20 Best Selling Products
SELECT product_id,
       COUNT(*) total_sales
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 20;

-- 10 Highest Freight Products
SELECT product_id,
       ROUND(AVG(freight_value),2) avg_freight
FROM order_items
GROUP BY product_id
ORDER BY avg_freight DESC
LIMIT 20;