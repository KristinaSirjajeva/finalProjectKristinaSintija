-- Following information about products should be stored:
-- Name
-- Calories per 100g
-- Category
-- Vegetarian/Vegan


CREATE TABLE IF NOT EXISTS Products (
    id BIGINT auto_increment PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    calories_per_100g INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    notes VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS Dishes (
    id BIGINT auto_increment PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    notes VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS Ingredients (
    dish BIGINT,
    ingredient BIGINT,
    foreign key (dish) references Dishes(id),
    foreign key (ingredient) references Products(id)
);

INSERT INTO Products
(name,calories_per_100g,category,notes) VALUES
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
('Pork belly, cooked', 518, 'Meat', NULL),
('Roast chicken', 223, 'Poultry', NULL),
('Chicken breast, cooked', 175, 'Poultry', NULL),
('Duck, cooked', 336, 'Poultry', NULL),
('Goose, roasted', 304, 'Poultry', NULL),
('Butter', 717, 'Dairy', 'Vegetarian'),
('Cheddar cheese', 408, 'Dairy', 'Vegetarian'),
('Milk, semi-skimmed', 50, 'Dairy', 'Vegetarian'),
('Milk, whole', 60, 'Dairy', 'Vegetarian'),
('Yogurt, plain, low-fat', 63, 'Dairy', 'Vegetarian');

INSERT INTO Dishes
(name,category,notes) VALUES
('Fruit salad', 'Dessert', 'Vegetarian');

INSERT INTO Ingredients VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 26);

-- list all dishes
SELECT * FROM Dishes;

-- list all dishes that belongs to the same category
SELECT *
FROM Dishes
WHERE category = ?;

-- list all dishes marked as vegetarian or vegan
SELECT *
FROM Dishes
WHERE notes = ?;

-- list all ingredients for a dish X
SELECT p.name
FROM Products p
    JOIN Ingredients i ON p.id = i.ingredient
    JOIN Dishes d ON i.dish = d.id
WHERE d.name = ?;

-- add a dish
INSERT INTO Dishes
(name,category,notes) VALUES
(?, ?, ?);

-- remove a dish
DELETE FROM Dishes WHERE id = ?;

-- list all products
SELECT * FROM Products;

-- add a product
INSERT INTO Products
(name,calories_per_100g,category,notes) VALUES
(?, ?, ?, ?);

-- remove a product
DELETE FROM Products WHERE id = ?;

-- modify product information
UPDATE Products
SET name = ?,calories_per_100g = ?,category = ?,notes = ?
WHERE id = ?;

-- list all products that belongs to the same category
SELECT *
FROM Products
WHERE category = ?;

-- list all products marked as vegetarian or vegan
SELECT *
FROM Products
WHERE notes = ?;

-- find a product by product name
SELECT *
FROM Products
WHERE name = ?;

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
