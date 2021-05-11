-- Following information about products should be stored:
-- Product name
-- Calories per 100g
-- Category
-- Vegetarian/Vegan


CREATE TABLE IF NOT EXISTS Products (
    id BIGINT auto_increment PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    calories_per_100g INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    notes VARCHAR(50) NULL
);

INSERT INTO Products
(product_name,calories_per_100g,category,notes) VALUES
('Apple', 52, 'Fruits', 'Vegan'),
('Apricot', 48, 'Fruits', 'Vegan'),
('Banana', 89, 'Fruits', 'Vegan'),
('Grapefruit', 42, 'Fruits', 'Vegan'),
('Grapes', 69, 'Fruits', 'Vegan''),
('Broccoli', 34, 'Vegetables', 'Vegan'),
('Brussels sprouts', 43, 'Vegetables', 'Vegan'),
('Cabbage, red', 31, 'Vegetables', 'Vegan'),
('Carrots', 41, 'Vegetables', 'Vegan'),
('Kidney beans, canned', 135, 'Legumes', 'Vegan'),
('Lentils, canned', 165, 'Legumes', 'Vegan'),
('Lima beans, canned', 122, 'Legumes', 'Vegan'),
('Peas, green', 81, 'Legumes', 'Vegan'),
('Rabbit, cooked', 172, 'Meat', NULL),
('Lamb, cooked', 265, 'Meat', NULL),
('Ground beef, cooked', 260, 'Meat', NULL),
('Beef steak, fried', 235, 'Meat', NULL),
('Pork belly, cooked', 518, 'Meat', NULL),
('Roast chicken', 223, 'Poultry'', NULL),
('Chicken breast, cooked', 175, 'Poultry', NULL),
('Duck, cooked', 336, 'Poultry', NULL),
('Goose, roasted', 304, 'Poultry', NULL),
('Butter', 717, 'Dairy', 'Vegetarian'),
('Cheddar cheese', 408, 'Dairy', 'Vegetarian'),
('Milk, semi-skimmed', 50, 'Dairy', 'Vegetarian'),
('Milk, whole', 60, 'Dairy', 'Vegetarian'),
('Yogurt, plain, low-fat', 63, 'Dairy', 'Vegetarian');

-- add a product
INSERT INTO Products
(product_name,calories_per_100g,category,notes) VALUES
(?, ?, ?, ?);

-- remove a product
DELETE FROM Products WHERE id = ?;



-- modify product information
UPDATE Products
SET product_name = ?,calories_per_100g = ?,category = ?,notes = ?
WHERE id = ?;

-- list all products
SELECT * FROM Products;

-- list all products that belongs to the same category ordered by calories amount
SELECT *
FROM Products
WHERE category = ?
ORDER By calories_per_100g;

-- list all products marked as vegetarian or vegan
SELECT *
FROM Products
WHERE notes = ?;

-- find a product by product name
SELECT *
FROM Products
WHERE product_name = ?;

-- find products with calories amount is equal to X
SELECT *
FROM Products
WHERE calories_per_100g = ?;

-- find products with calories amount is equal to X or more
SELECT *
FROM Products
WHERE calories_per_100g >= ?;

-- find products with calories amount is equal to X or less
SELECT *
FROM Products
WHERE calories_per_100g <= ?;
