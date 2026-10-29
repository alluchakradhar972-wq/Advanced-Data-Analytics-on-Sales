-----------------------------------------
-- Data Segmentation
-----------------------------------------
/*
SEGMENT THE DATA INTO COST RANGES AND COUNT HOW MANY PRODUCTS FALL INTO EACH SEGMENT
*/
WITH sales_segmentation AS (SELECT
product_key,
product_name,
product_cost,
CASE
WHEN product_cost < 100 THEN 'Below 100'
WHEN product_cost BETWEEN 100 AND 500 THEN '100-500'
WHEN product_cost BETWEEN 500 AND 1000 THEN '500-1000'
WHEN product_cost >1000 THEN 'Above 1000'
END AS cost_category
FROM gold.dim_products)

SELECT
cost_category,
COUNT(product_key) AS no_of_products
FROM sales_segmentation
GROUP BY cost_category
ORDER BY COUNT(product_key) DESC;

/*
Group customers into three segments based on their spending behaviour:
--VIP : customers with atleast 12 months of history and spending more than $5,000
--Regular : customers with atleast 12 months of history but spending $5,000 or less
--New : customers with a lifespan less than 12 months
*/
WITH customer_segments AS (
SELECT
customer_id,
DATEDIFF(month,MIN(order_date),MAX(order_date)) AS months_span,
SUM(sales_amount) AS total_sales,
CASE
WHEN DATEDIFF(month,MIN(order_date),MAX(order_date))>=12 AND SUM(sales_amount)>5000 THEN 'VIP'
WHEN DATEDIFF(month,MIN(order_date),MAX(order_date))>=12 AND SUM(sales_amount)<=5000 THEN 'Regular'
ELSE 'New'
END AS customer_type
FROM gold.fact_sales
GROUP BY customer_id)

SELECT
--*
customer_type,
COUNT(customer_id) AS customer_type_count
FROM customer_segments
GROUP BY customer_type
ORDER BY COUNT(customer_id) DESC