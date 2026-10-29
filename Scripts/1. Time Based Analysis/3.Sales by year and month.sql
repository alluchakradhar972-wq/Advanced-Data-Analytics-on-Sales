--SALES BY YEAR AND MONTH
SELECT
YEAR(order_date) AS year,
MONTH(order_date) AS month,
SUM(sales_amount) AS  sales_by_month_year
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY YEAR(order_date),MONTH(order_date)

--SECOND METHOD
SELECT
FORMAT(order_date,'yyyy-MMM'),
SUM(sales_amount) AS  sales_by_month_year
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date,'yyyy-MMM')


SELECT
DATETRUNC(month,order_date) AS year_month,
SUM(sales_amount) AS  sales_by_month_year
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date)