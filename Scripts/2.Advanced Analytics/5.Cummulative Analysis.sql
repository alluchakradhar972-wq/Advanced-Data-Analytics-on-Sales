-----------------------------------------
--Cumulative analysis
-----------------------------------------
--calculate the total sales for each month and the running total os sales over time 
--USUALLY USE DAATETRUNC FOR THIS KIND OF TASKS
SELECT
*,
SUM(sales_by_month) OVER(ORDER BY order_month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_monthly_sales
FROM
(SELECT
DATETRUNC(month,order_date) AS order_month,
SUM(sales_amount) AS  sales_by_month
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date)
)t

--IF WE WISH TO THE RUNNING TOTAL FOR EACH YEAR
SELECT
*,
SUM(sales_by_month) OVER(PARTITION BY YEAR(order_month) ORDER BY order_month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_monthly_sales
FROM
(SELECT
DATETRUNC(month,order_date) AS order_month,
SUM(sales_amount) AS  sales_by_month
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date)
)t

--IF WE WANT CUMULATIVE METRIC OVER YEARS WE CAN DO THEE SAME 
SELECT
*,
SUM(sales_by_month) OVER(ORDER BY order_year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_yearly_sales
FROM
(SELECT
DATETRUNC(year,order_date) AS order_year,
SUM(sales_amount) AS  sales_by_month
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year,order_date)
)t

--what if we wish to know the cmulative value of avg price over years as well
SELECT
*,
SUM(sales_by_month) OVER(ORDER BY order_year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_monthly_sales,
SUM(avg_price) OVER(ORDER BY order_year) AS running_yearly_avg
FROM
(SELECT
DATETRUNC(year,order_date) AS order_year,
SUM(sales_amount) AS  sales_by_month,
AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year,order_date)
)t