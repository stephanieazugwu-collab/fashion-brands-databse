-- Fashion Brands Database Schema

CREATE TABLE brands (
    brand_id INTEGER PRIMARY KEY,
    brand_name TEXT NOT NULL UNIQUE,
    country TEXT,
    tier TEXT CHECK (tier IN ('Luxury', 'Premium', 'Mass'))
);

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL UNIQUE
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    brand_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    product_name TEXT NOT NULL,
    material TEXT,
    gender TEXT CHECK (gender IN ('Women', 'Men', 'Unisex')),
    list_price REAL NOT NULL CHECK (list_price > 0),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    age_group TEXT,
    region TEXT
);

CREATE TABLE reviews (
    review_id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    recommend INTEGER CHECK (recommend IN (0, 1)),
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE inventory (
    inventory_id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    size TEXT,
    color TEXT,
    quantity_on_hand INTEGER CHECK (quantity_on_hand >= 0),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

