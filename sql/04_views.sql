-- Views for Fashion Brands Database

-- View: brand summary (avg price, avg rating, review count)
CREATE VIEW IF NOT EXISTS vw_brand_summary AS
SELECT
  b.brand_name,
  ROUND(AVG(p.list_price), 2) AS avg_price,
  ROUND(AVG(r.rating), 2) AS avg_rating,
  ROUND(100.0 * AVG(r.recommend), 1) AS pct_recommended,
  COUNT(r.review_id) AS review_count
FROM brands b
JOIN products p ON p.brand_id = b.brand_id
LEFT JOIN reviews r ON r.product_id = p.product_id
GROUP BY b.brand_name;

-- View: low stock items
CREATE VIEW IF NOT EXISTS vw_low_stock AS
SELECT
  b.brand_name,
  p.product_name,
  i.size,
  i.color,
  i.quantity_on_hand
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id
WHERE i.quantity_on_hand < 10;

