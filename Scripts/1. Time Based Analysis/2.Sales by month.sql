--sales by month
SELECT
MONTH(order_date) AS month,
SUM(sales_amount) AS  sales_by_month
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date)