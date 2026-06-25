USE ecommerce_analytics1;

-- 1 Average Rating
SELECT ROUND(AVG(review_score),2)
AS avg_rating
FROM reviews;

-- 2 Rating Distribution
SELECT review_score,
       COUNT(*) total_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;

-- 3 5-Star Reviews
SELECT COUNT(*) total_5_star
FROM reviews
WHERE review_score=5;

-- 4 1-Star Reviews
SELECT COUNT(*) total_1_star
FROM reviews
WHERE review_score=1;

-- 5 Review Percentage by Score
SELECT review_score,
       ROUND(COUNT(*)*100/
       (SELECT COUNT(*) FROM reviews),2)
       percentage
FROM reviews
GROUP BY review_score;

-- 6 Best Rated Categories
SELECT p.product_category_name,
       ROUND(AVG(r.review_score),2)
       avg_rating
FROM reviews r
JOIN order_items oi ON r.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
GROUP BY p.product_category_name
ORDER BY avg_rating DESC
LIMIT 10;

-- 7 Worst Rated Categories
SELECT p.product_category_name,
       ROUND(AVG(r.review_score),2)
       avg_rating
FROM reviews r
JOIN order_items oi ON r.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
GROUP BY p.product_category_name
ORDER BY avg_rating ASC
LIMIT 10;

-- 8 Reviews by Month
SELECT DATE_FORMAT(review_creation_date,'%Y-%m')
AS month,
COUNT(*) total_reviews
FROM reviews
GROUP BY month
ORDER BY month;

-- 9 Orders Without Reviews
SELECT COUNT(*) total_orders_without_reviews
FROM orders o
LEFT JOIN reviews r
ON o.order_id=r.order_id
WHERE r.review_id IS NULL;

-- 10 Seller Average Ratings
SELECT oi.seller_id,
       ROUND(AVG(r.review_score),2)
       avg_rating
FROM reviews r
JOIN order_items oi
ON r.order_id=oi.order_id
GROUP BY oi.seller_id
ORDER BY avg_rating DESC
LIMIT 20;