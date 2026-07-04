CREATE TABLE fact_order_products AS
SELECT order_id, product_id, add_to_cart_order, reordered FROM order_products_prior
UNION ALL
SELECT order_id, product_id, add_to_cart_order, reordered FROM order_products_train ;

ALTER TABLE fact_order_products 
ADD PRIMARY KEY (order_id, product_id) ;

DROP TABLE order_products_prior;
DROP TABLE order_products_train;