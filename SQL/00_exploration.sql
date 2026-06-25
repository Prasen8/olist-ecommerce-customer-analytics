-- 1. Show all databases
SHOW DATABASES;

-- 2. Select your database
USE ecommerce_analytics1;

-- 3. Show all tables
SHOW TABLES;

-- 4. Check table structures
DESC customers;
DESC orders;
DESC order_items;
DESC products;
DESC payments;
DESC reviews;
DESC sellers;
DESC category_translation;

-- 5. Verify row counts
SELECT COUNT(*) AS customers_count FROM customers;
SELECT COUNT(*) AS orders_count FROM orders;
SELECT COUNT(*) AS order_items_count FROM order_items;
SELECT COUNT(*) AS products_count FROM products;
SELECT COUNT(*) AS payments_count FROM payments;
SELECT COUNT(*) AS reviews_count FROM reviews;
SELECT COUNT(*) AS sellers_count FROM sellers;
SELECT COUNT(*) AS category_translation_count FROM category_translation;

-- 6. View sample data
SELECT * FROM customers LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM reviews LIMIT 5;