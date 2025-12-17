-- Fashion Brands Database: Portfolio Queries

-- 1) List all products with their brand + category (JOIN practice)
SELECT
  p.product_id,
  p.product_name,
  b.brand_name,
  c.category_name,
  p.list_price
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
JOIN categories c ON p.category_id = c.category_id
ORDER BY p.list_price DESC;

-- 2) Average price per brand (GROUP BY)
SELECT
  b.brand_name,
  ROUND(AVG(p.list_price), 2) AS avg_price
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY avg_price DESC;

-- 3) Average rating + % recommended per brand (report-style query)
SELECT
  b.brand_name,
  ROUND(AVG(r.rating), 2) AS avg_rating,
  ROUND(100.0 * AVG(r.recommend), 1) AS pct_recommended,
  COUNT(*) AS review_count
FROM reviews r
JOIN products p ON r.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY avg_rating DESC, pct_recommended DESC;

-- 4) Low stock report (inventory)
SELECT
  b.brand_name,
  p.product_name,
  i.size,
  i.color,
  i.quantity_on_hand
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id
WHERE i.quantity_on_hand < 10
ORDER BY i.quantity_on_hand ASC;

