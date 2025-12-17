-- Fashion Brands Database Schema

DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS brands;

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name NVARCHAR(100) NOT NULL UNIQUE,
    country NVARCHAR(100),
    tier NVARCHAR(20) CHECK (tier IN ('Luxury', 'Premium', 'Mass'))
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    product_name NVARCHAR(100) NOT NULL,
    material NVARCHAR(100),
    gender NVARCHAR(100) CHECK (gender IN ('Women', 'Men', 'Unisex')),
    list_price REAL NOT NULL CHECK (list_price > 0),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    age_group NVARCHAR(100),
    region NVARCHAR(100)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    recommend INT CHECK (recommend IN (0, 1)),
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    size NVARCHAR(100),
    color NVARCHAR(100),
    quantity_on_hand INT CHECK (quantity_on_hand >= 0),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

SELECT name
FROM sys.tables;
