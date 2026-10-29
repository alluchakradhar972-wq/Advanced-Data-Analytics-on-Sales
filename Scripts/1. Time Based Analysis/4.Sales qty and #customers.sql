--SALES,QUANTITY AND NO OF CUSTOMERS OF A PARTICULAR YEAR
SELECT
YEAR(order_date) AS year,
MONTH(order_date) AS month,
SUM(sales_amount) AS  sales_by_month_year,
SUM(sales_quantity) AS  quantity_by_month_year,
COUNT(customer_id) AS  no_of_customers
FROM gold.fact_sales
WHERE order_date IS NOT NULL AND YEAR(order_date) = 2013
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY YEAR(order_date),MONTH(order_date)