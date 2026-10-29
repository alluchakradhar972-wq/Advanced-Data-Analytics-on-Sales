--Sales by year
SELECT
YEAR(order_date) AS year,
SUM(sales_amount) AS  sales_by_month
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)