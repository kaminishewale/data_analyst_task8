WITH customer_sales AS (
    SELECT 
        "Customer ID",
        "Customer Name",
        "Region",
        SUM("Sales") AS total_sales
    FROM "Global_Superstore2"
    GROUP BY "Customer ID", "Customer Name", "Region"
)
SELECT 
    "Region",
    "Customer Name",
    total_sales,
    ROW_NUMBER() OVER (PARTITION BY "Region" ORDER BY total_sales DESC) AS row_num,
    RANK() OVER (PARTITION BY "Region" ORDER BY total_sales DESC) AS rank_num,
    DENSE_RANK() OVER (PARTITION BY "Region" ORDER BY total_sales DESC) AS dense_rank_num
FROM customer_sales;

SELECT name FROM sqlite_master WHERE type='table';

SELECT * FROM "Global_Superstore2" LIMIT 5;

SELECT 
    order_id,
    order_date,
    sales,
    SUM(sales) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_sales
FROM "Global_Superstore2";

SELECT 
    "Order ID",
    "Order Date",
    "Sales",
    SUM("Sales") OVER (ORDER BY "Order Date" ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_sales
FROM "Global_Superstore2";

WITH monthly_sales AS (
    SELECT 
        STRFTIME('%Y', "Order Date") AS sales_year,
        STRFTIME('%m', "Order Date") AS sales_month,
        SUM("Sales") AS current_month_sales
    FROM "Global_Superstore2"
    GROUP BY sales_year, sales_month
),
lagged_sales AS (
    SELECT 
        sales_year,
        sales_month,
        current_month_sales,
        LAG(current_month_sales, 1) OVER (ORDER BY sales_year, sales_month) AS previous_month_sales
    FROM monthly_sales
)
SELECT 
    sales_year,
    sales_month,
    current_month_sales,
    previous_month_sales,
    ROUND(current_month_sales - previous_month_sales, 2) AS absolute_growth,
    ROUND(((current_month_sales - previous_month_sales) / previous_month_sales) * 100, 2) AS mom_growth_percentage
FROM lagged_sales;

WITH product_ranks AS (
    SELECT 
        "Category",
        "Product ID",
        "Product Name",
        SUM("Sales") AS total_product_sales,
        DENSE_RANK() OVER (PARTITION BY "Category" ORDER BY SUM("Sales") DESC) AS product_rank
    FROM "Global_Superstore2"
    GROUP BY "Category", "Product ID", "Product Name"
)
SELECT 
    "Category",
    product_rank,
    "Product ID",
    "Product Name",
    total_product_sales
FROM product_ranks
WHERE product_rank <= 3;