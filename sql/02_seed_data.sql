-- Seed data for Fashion Brands Database

-- Brands
INSERT INTO brands (brand_id, brand_name, country, tier) VALUES
(1, 'Gucci', 'Italy', 'Luxury'),
(2, 'Zara', 'Spain', 'Mass'),
(3, 'Nike', 'USA', 'Premium');

-- Categories
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Bags'),
(2, 'Shoes'),
(3, 'Clothing');

-- Products
INSERT INTO products (product_id, brand_id, category_id, product_name, material, gender, list_price) VALUES
(1, 1, 1, 'Leather Tote', 'Leather', 'Women', 2200),
(2, 2, 3, 'Summer Dress', 'Cotton', 'Women', 79),
(3, 3, 2, 'Running Sneakers', 'Mesh', 'Unisex', 140);

-- Customers
INSERT INTO customers (customer_id, age_group, region) VALUES
(1, '18-25', 'North America'),
(2, '26-35', 'Europe');

-- Reviews
INSERT INTO reviews (review_id, product_id, customer_id, rating, recommend, review_date) VALUES
(1, 1, 1, 5, 1, '2024-01-10'),
(2, 2, 2, 4, 1, '2024-02-03'),
(3, 3, 1, 5, 1, '2024-03-15');

-- Inventory
INSERT INTO inventory (inventory_id, product_id, size, color, quantity_on_hand) VALUES
(1, 1, 'M', 'Black', 5),
(2, 2, 'S', 'Yellow', 12),
(3, 3, '10', 'White', 20);

