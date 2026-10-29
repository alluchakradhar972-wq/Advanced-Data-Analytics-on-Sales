/*
===============================================================================
Customer Report
===============================================================================
Purpose:
    - This report consolidates key customer metrics and behaviors

Highlights:
    1. Gathers essential fields such as names, ages, and transaction details.
    2. Segments customers into categories (VIP, Regular, New) and age groups.
    3. Aggregates customer-level metrics:
       - total orders
       - total sales
       - total quantity purchased
       - total products
       - lifespan (in months)
    4. Calculates valuable KPIs:
        - recency (months since last order)
        - average order value
        - average monthly spend
===============================================================================
*/
-------------------------------------------------------------------------------
--1. Gathers essential fields such as names, ages, and transaction details.
-------------------------------------------------------------------------------
DROP VIEW IF EXISTS gold.report_customers
GO
CREATE VIEW gold.report_customers AS 
WITH customer_details AS (SELECT
F.order_number,
F.product_number,
F.order_date,
F.sales_amount,
F.sales_quantity,
C.customer_id,
C.customer_number,
CONCAT(C.first_name,' ',C.last_name) AS full_name,
DATEDIFF(year,C.date_of_birth,GETDATE()) AS age
FROM gold.fact_sales AS F
LEFT JOIN gold.dim_customers AS  C
ON F.customer_id = C.customer_id
WHERE F.order_date IS NOT NULL)

,
-------------------------------------------------------------------------------
--Aggregates customer-level metrics
-------------------------------------------------------------------------------
customer_aggregation AS
(SELECT
    customer_id,
    customer_number,
    full_name,
    age,
    COUNT(DISTINCT order_number) AS total_orders,
    SUM(sales_amount) AS total_sales,
    SUM(sales_quantity) as total_quantity,
    COUNT(DISTINCT product_number) AS total_products,
    MAX(order_date) AS last_orderdate,
    DATEDIFF(month,MIN(order_date),MAX(order_date)) AS month_span
FROM customer_details
GROUP BY customer_id,
customer_number,
full_name,
age)

-----------------------------------------------------------------------------------------
--Segments customers into categories, Calculates valuable KPIs(Key Performance Indicator)
-----------------------------------------------------------------------------------------
SELECT
customer_id,
customer_number,
full_name,
age,
CASE
WHEN age BETWEEN 12 AND 18 THEN 'Teen'
WHEN age BETWEEN 19 AND 50 THEN 'Adult'
WHEN age < 12 THEN 'Child'
ELSE 'OLD'
END AS age_groups,
total_orders,
last_orderdate,
DATEDIFF(month,last_orderdate,GETDATE()) AS recency,
total_sales,
-- CALCULATE THE AVERAGE ORDER VALUE
CASE
WHEN total_orders=0 THEN 0
ELSE total_sales/total_orders
END AS avg_order_value,
CASE
WHEN month_span >=12 AND total_sales > 5000 THEN 'VIP'
WHEN month_span >=12 AND total_sales <= 5000 THEN 'Regular'
ELSE 'New'
END AS customer_segment,
total_quantity,
total_products,
month_span,
--CALCULATE THE AVERAGE MONTHLY SPEND
CASE 
WHEN month_span =0 THEN total_sales
ELSE total_sales/month_span
END AS avg_monthly_spend
FROM customer_aggregation

--rUN THE BELOW CODE TO SEE THE REPORT
/*
SELECT * FROM gold.report_customers
*/
