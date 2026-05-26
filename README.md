# Data Analyst Internship - Task 8: SQL Window Functions

## 📌 Project Overview
This project focuses on utilizing advanced SQL Window Functions (specifically Ranking, Running Totals, and Lead/Lag calculations) to extract meaningful business insights from an e-commerce retail dataset. 

## 🛠️ Tools Used
* **Database Management System:** SQLite / DB Browser for SQLite
* **Dataset:** Global Superstore Dataset

## 📂 Deliverables Included
1. **`task8_window.sql`**: Complete SQL script containing all analytical window function queries.
2. **`ranked_customers.csv`**: Exported results showing customer sales performance ranked across separate geographic regions using `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()`.
3. **`mom_growth.csv`**: Aggregated calculation tracking historical sales and month-over-month (MoM) revenue growth rates.
4. **`insights_task8.txt`**: A structured breakdown detailing key findings regarding tie-handling behaviors, running totals, and seasonal variance patterns.

## 💡 Key SQL Concepts Applied
* **`PARTITION BY`**: Used to group records into distinct analytical boundaries (e.g., separating calculations by geographic regions or product categories).
* **Ranking Functions**: Compared structural behavioral differences between `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()` when processing data ties.
* **Running Totals**: Calculated cumulative operational values over linear time frames using sequential order parameters.
* **`LAG()` Analytical Function**: Pulled metrics from sequential preceding rows to perform historical period-over-period delta checks without requiring intensive table self-joins.
