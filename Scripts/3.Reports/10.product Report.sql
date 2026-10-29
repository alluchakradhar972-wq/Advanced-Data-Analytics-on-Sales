/*
================================================================================
Product Report
================================================================================

Purpose:
    - This report consolidates key product metrics and behaviors.

Highlights:
    1. Gathers essential fields such as product name, category, subcategory, and cost.
    2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
    3. Aggregates product-level metrics:
        - total orders
        - total sales
        - total quantity sold
        - total customers (unique)
        - lifespan (in months)
    4. Calculates valuable KPIs:
        - recency (months since last sale)
        - average order revenue (AOR)
        - average monthly revenue
================================================================================
*/
DROP VIEW IF EXISTS gold.report_products
GO
CREATE VIEW gold.report_products AS 
WITH products_details AS 
(SELECT
P.product_name,
p.product_number,
P.category,
P.sub_category,
P.product_cost,
F.order_number,
F.order_date,
F.sales_amount,
F.sales_quantity,
F.customer_id
FROM gold.fact_sales AS F
LEFT JOIN gold.dim_products AS P
ON F.product_number = P.product_number
WHERE F.order_date IS NOT NULL)


, big_numbers AS
(SELECT
product_name,
product_number,
category,
sub_category,
product_cost,
COUNT(order_number) AS total_orders,
SUM(sales_amount) AS total_sales,
SUM(sales_quantity) AS total_qty_sold,
COUNT(DISTINCT customer_id) AS total_customers,
MAX(order_date) AS last_orderdate,
DATEDIFF(month,MIN(order_date),MAX(order_date)) AS span_in_months,
CASE
WHEN SUM(sales_amount) > 1000000 THEN 'High-performers'
WHEN SUM(sales_amount) BETWEEN 500000 AND 1000000 THEN 'Mid_range'
ELSE 'Low-performers'
END AS performance
FROM products_details
GROUP BY product_name,
product_number,
category,
sub_category,
product_cost)



SELECT
*,
DATEDIFF(month,last_orderdate,GETDATE()) AS recency,
CASE
WHEN total_orders =0  THEN 0
ELSE total_sales/total_orders
END AS avg_order_revenue,
CASE
WHEN span_in_months =0  THEN total_sales
ELSE total_sales/span_in_months
END AS avg_monthly_revenue
FROM big_numbers



--RUN THE BELOW CODE TO SEE THE REPORT
/*
SELECT * FROM gold.report_products
*/




































































