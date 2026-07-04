CREATE TABLE orders(
order_id INT PRIMARY KEY,
user_id INT,
eval_set VARCHAR(20),
order_number INT,
order_dow INT,
order_hour_of_day INT,
days_since_prior_order INT
);

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(200),
aisle_id INT,
department_id INT
);

CREATE TABLE order_products_prior(
order_id INT,
product_id INT,
add_to_cart_order INT,
reordered INT,
PRIMARY KEY (order_id, product_id)
);

CREATE TABLE order_products_train(
order_id INT,
product_id INT,
add_to_cart_order INT,
reordered INT,
PRIMARY KEY (order_id, product_id)
);

CREATE TABLE aisles(
aisles_id INT PRIMARY KEY,
aisle VARCHAR(100)
);

CREATE TABLE departments(
department_id INT PRIMARY KEY,
department VARCHAR(100)
);
