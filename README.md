# 📊 Advanced SQL Data Analytics Project

## 📌 Project Overview

This project focuses on performing **advanced data analytics using Microsoft SQL Server (T-SQL)** to uncover business trends, evaluate sales performance, analyze customer behavior, and segment products and customers.

The project follows an end-to-end analytical workflow, progressing from time-based analysis and cumulative metrics to performance comparisons, part-to-whole analysis, customer segmentation, and reusable customer and product reports.

The goal is to demonstrate how advanced SQL techniques can transform raw transactional data into meaningful business insights that support strategic decision-making.

## 🎯 Project Objectives

- Analyze sales performance over time to identify trends and seasonality.
- Calculate running totals and moving averages using window functions.
- Compare current performance with historical results and average benchmarks.
- Measure category-level contributions to total sales.
- Segment products based on cost ranges and sales performance.
- Classify customers according to spending behavior and customer lifespan.
- Calculate customer recency, spending, and other business KPIs.
- Build reusable customer and product reports using SQL views.

## 🛠️ Tools and Technologies

- **Database:** Microsoft SQL Server
- **Query Language:** T-SQL
- **Database Tool:** SQL Server Management Studio (SSMS)
- **Core Concepts:** Advanced SQL Analytics, Business Intelligence, Customer Analytics, Product Analytics
- **SQL Techniques:** Window Functions, CTEs, Aggregate Functions, `CASE` Expressions, Date Functions, Subqueries, Views, Joins, Conditional Aggregation

## 📂 Project Workflow

### 1. Database Exploration and Setup

Prepare the database and understand the available data before beginning the analysis.

- Create or restore the sample database.
- Explore the database schema and table relationships.
- Identify relevant sales, customer, and product tables.
- Understand the structure of transactional and descriptive data.

### 2. Change Over Time Analysis

Analyze business performance across different time periods to identify trends and seasonal patterns.

- Calculate yearly and monthly sales revenue.
- Track changes in the number of customers and quantities sold.
- Identify periods of growth and decline.
- Examine sales patterns across years and months.

**SQL concepts:** `YEAR()`, date formatting, date grouping, `SUM()`, `COUNT()`, `GROUP BY`.

### 3. Cumulative and Performance Analysis

Use window functions to evaluate business performance over time.

- Calculate cumulative sales and running totals.
- Compute moving averages to smooth short-term fluctuations.
- Compare yearly product sales against average performance.
- Compare current-year sales with previous-year results.
- Identify products performing above or below historical benchmarks.

**SQL concepts:** `SUM() OVER()`, `AVG() OVER()`, `LAG()`, `PARTITION BY`, `ORDER BY`, Common Table Expressions (CTEs).

### 4. Performance Comparison Analysis

Evaluate whether business performance is improving or declining.

- Compare current and previous sales values.
- Calculate absolute differences and percentage changes.
- Flag products with increasing or decreasing sales.
- Classify performance as above or below average.
- Identify products requiring further investigation.

This stage helps convert raw numerical comparisons into interpretable business indicators.

### 5. Part-to-Whole Analysis

Understand how individual categories contribute to total business revenue.

- Calculate total sales by product category.
- Determine each category's percentage contribution to overall sales.
- Compare the relative importance of different categories.
- Identify categories that contribute most to revenue.

**SQL concepts:** Window aggregates, `SUM() OVER()`, subqueries, percentage calculations.

### 6. Product Segmentation

Group products into meaningful categories to support inventory and sales analysis.

- Classify products into cost ranges using conditional logic.
- Count products within each cost segment.
- Analyze revenue and sales quantities across product groups.
- Compare the distribution of products across segments.

**SQL concepts:** `CASE`, `GROUP BY`, aggregate functions, conditional classification.

### 7. Customer Segmentation

Analyze customer spending behavior and classify customers into business-relevant groups.

- Calculate total spending for each customer.
- Determine customer lifespan using first and last purchase dates.
- Classify customers as VIP, Regular, or New based on defined business rules.
- Count customers in each segment.
- Compare spending behavior across customer groups.

This analysis helps identify high-value customers and understand differences in purchasing behavior.

### 8. Customer Report Development

Create a consolidated customer-level report containing descriptive attributes and behavioral metrics.

The report can include:

- Customer ID and customer details.
- Age and age group.
- Total number of orders.
- Total sales or lifetime spending.
- First and last purchase dates.
- Customer lifespan.
- Recency, measured as the time since the most recent purchase.
- Customer segment: VIP, Regular, or New.

The final customer report is organized as a reusable SQL view, allowing the results to be queried without rewriting the entire analytical query.

### 9. Product Report Development

Build a consolidated product-level report to evaluate product performance and purchasing activity.

The report can include:

- Product ID and product name.
- Product category and subcategory.
- Product cost and cost segment.
- Total quantity sold.
- Total sales revenue.
- Number of orders or customers associated with the product.
- First and last sales dates.
- Product recency.
- Relevant revenue and performance KPIs.

The resulting product report is saved as a SQL view for reuse in further analysis and business intelligence workflows.

## 💡 Key Business Questions

This project explores questions such as:

1. How have sales revenue and quantities changed over time?
2. Which months or years show the strongest sales performance?
3. Are sales increasing or decreasing compared with the previous year?
4. Which products perform above or below their historical averages?
5. What percentage of total revenue comes from each product category?
6. How are products distributed across different cost segments?
7. Who are the highest-value customers based on total spending?
8. How many customers belong to VIP, Regular, and New segments?
9. Which customers have not purchased recently?
10. Which products generate the most revenue, and which have gone the longest without selling?
11. How can reusable SQL views simplify recurring business reporting?

## 📈 Expected Analytical Outcomes

The project aims to produce:

- Time-based sales trends and performance comparisons.
- Cumulative sales and moving-average metrics.
- Product-level growth and decline indicators.
- Category contribution percentages.
- Product cost-segment summaries.
- Customer spending segments and customer-level KPIs.
- Reusable customer and product analytical views.
- A foundation for dashboards and more advanced business intelligence analysis.

*Actual findings and numerical results should be added after executing the SQL queries against the dataset.*

## 🧠 Key Learnings

Through this project, I aim to strengthen my skills in:

- Advanced SQL query writing and optimization.
- Time-based business analysis.
- Window functions and analytical calculations.
- Running totals and moving averages.
- Year-over-year performance comparisons.
- Part-to-whole analysis and percentage contribution.
- Customer lifetime and recency calculations.
- Rule-based customer and product segmentation.
- Designing reusable SQL views.
- Translating business requirements into analytical reports.

## 📁 Suggested Repository Structure

```text
Advanced-Data-Analysis-of-Sales/
│
├── Datasets/
├── README.md
├── scripts/
│   ├── 1_time_based_analysis/
│   │   ├── 01_sales_by_year.sql
│   │   ├── 02_sales_by_month.sql
│   │   ├── 03_sales_by_year_and_month.sql
│   │   └── 04_sales_qty_and_customers.sql
│   │
│   ├── 2_advanced_analytics/
│   │   ├── 05_cumulative_analysis.sql
│   │   ├── 06_performance_analysis.sql
│   │   ├── 07_part_to_whole_analysis.sql
│   │   └── 08_data_segmentation.sql
│   │
│   └── 3_reports/
│       ├── 09_customer_report.sql
│       └── 10_product_report.sql
```

*This is a suggested structure. Adjust the folder and file names to match the SQL scripts you actually upload.*

## 🚀 How to Run the Project

1. Install or access Microsoft SQL Server and SQL Server Management Studio (SSMS).
2.Download the data sets and upload them into SQL Server Management Studio (SSMS).
3. Open the SQL scripts in SSMS..
4. Execute the scripts in sequence, starting with database exploration.
5. Review the results and document meaningful business findings.

**Note:** Date functions and formatting syntax can differ between database systems. This project is designed for SQL Server, so adapt functions such as `DATE_TRUNC()` or `FORMAT()` as necessary for the SQL dialect and server version you use.

## 🔮 Future Improvements

- Build an interactive Power BI dashboard using the customer and product views.
- Add month-over-month and year-over-year KPI visualizations.
- Investigate customer retention and repeat-purchase behavior.
- Perform product contribution and profitability analysis where cost and margin data are available.
- Integrate Python for statistical analysis and predictive modeling.
- Develop customer lifetime value and churn prediction models.
- Automate data refresh and reporting workflows.

## 👨‍💻 Project Summary

This project demonstrates how **advanced SQL can be used to move beyond basic querying and build a complete business analytics workflow**.

By combining time-based analysis, window functions, performance comparisons, segmentation, and reusable reporting views, the project establishes a foundation for data analytics, business intelligence, and future machine learning applications.

**Skills demonstrated:** SQL Server · T-SQL · Advanced SQL Analytics · Window Functions · Time-Series Analysis · Customer Segmentation · Product Analytics · KPI Reporting · SQL Views · Business Intelligence

## 🤝 Connect With Me

- **LinkedIn:** https://www.linkedin.com/in/chakradhar-allu-22117a290/?isSelfProfile=true
- **GitHub:** https://github.com/alluchakradhar972-wq

---

⭐ If you find this project useful, feel free to explore the repository and share your feedback.
