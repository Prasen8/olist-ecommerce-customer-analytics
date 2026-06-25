-- ====================================
-- DATA QUALITY CHECKS
-- Project: Olist E-Commerce Analysis
-- ====================================

USE ecommerce_analytics1;

-- Check total rows in each table

SELECT COUNT(*) AS customers_count
FROM customers;

SELECT COUNT(*) AS orders_count
FROM orders;

SELECT COUNT(*) AS products_count
FROM products;

SELECT COUNT(*) AS sellers_count
FROM sellers;

-- Check for NULL values

SELECT *
FROM customers
WHERE customer_id IS NULL;

SELECT *
FROM orders
WHERE order_id IS NULL;

-- Check duplicate customer IDs

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Check duplicate order IDs

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Check missing product categories

SELECT COUNT(*) AS missing_categories
FROM products
WHERE product_category_name IS NULL;