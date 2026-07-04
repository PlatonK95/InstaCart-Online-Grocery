
WITH day_hour AS(
SELECT order_id,order_dow,order_hour_of_day,user_id,order_number,
CASE order_dow
	WHEN 0 THEN 'Sunday'
	WHEN 1 THEN 'Monday'
	WHEN 2 THEN 'Tuesday'
	WHEN 3 THEN 'Wednesday'
	WHEN 4 THEN 'Thursday'
	WHEN 5 THEN 'Friday'
	WHEN 6 THEN 'Saturday'
END AS DAY
FROM public.orders
),
clean_table AS(
SELECT fop.order_id,user_id,order_number,products.product_id,add_to_cart_order,reordered,product_name,department,order_dow,order_hour_of_day,day,
CASE 
	WHEN order_hour_of_day BETWEEN 0 AND 5 THEN 'Night'
	WHEN order_hour_of_day BETWEEN 6 AND 7 THEN 'Dawn'
	WHEN order_hour_of_day BETWEEN 8 AND 12 THEN 'Morning'
	WHEN order_hour_of_day BETWEEN 13 AND 17 THEN 'Noon'
	WHEN order_hour_of_day BETWEEN 18 AND 20 THEN 'Dusk'
	WHEN order_hour_of_day BETWEEN 21 AND 23 THEN 'Evening'
END AS time_zone
FROM public.fact_order_products fop
JOIN public.products ON fop.product_id = products.product_id
JOIN day_hour ON fop.order_id = day_hour.order_id
JOIN public.departments ON products.department_id = departments.department_id
)
SELECT COUNT(DISTINCT(order_id)) AS sum_unique_orders,department,order_dow,day,order_hour_of_day,time_zone
FROM clean_table 
GROUP BY department,order_dow,day,order_hour_of_day,time_zone
ORDER BY sum_unique_orders;


