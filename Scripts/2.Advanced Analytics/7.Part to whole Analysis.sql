-----------------------------------------
-- Part to Whole analysis
-----------------------------------------
-- which categories contribute the most to the overall sales
WITH category_sales AS (SELECT
P.category,
SUM(F.sales_amount) AS total_sales
FROM gold.fact_sales AS F
LEFT JOIN gold.dim_products AS P
ON F.product_number = P.product_number
GROUP BY P.category)

SELECT
category,
total_sales,
SUM(total_sales) OVER() AS overall_sales,
CONCAT(ROUND((CAST(total_sales AS FLOAT)/SUM(total_sales) OVER())*100,2),' %') AS sales_percent
FROM category_sales
ORDER BY total_sales DESC