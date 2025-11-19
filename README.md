📦 Zepto Inventory SQL Analysis
SQL-based inventory and pricing analysis using PostgreSQL on a Zepto grocery dataset.

📌 Project Overview
This project analyzes inventory levels, pricing patterns, discounts, and product availability using PostgreSQL.
The goal is to identify out-of-stock risks, pricing issues, duplicate SKUs, and category-wise revenue opportunities.

📊 Dataset Details
Columns included:
category
name
mrp
discountPercent
availableQuantity
discountSellingPrice
weightInGMS
outOfStock
quantity

🛠 Technologies Used
PostgreSQL
SQL (Data Cleaning + Analysis)

🔍 Key Insights
✔ Stock Availability
In-stock vs out-of-stock product count.

✔ Duplicate SKUs
Identified products appearing multiple times.

✔ Pricing Clean-Up
Removed zero-price items and converted paise to rupees.

✔ Category Revenue
Calculated total potential revenue for each product category.

✔ High Discounts
Top 10 products with highest discount percentages.

✔ Weight Classification
Classified products into low, medium, and bulk categories.

✔ Total Inventory Weight
Computed total inventory weight per product category.

📁 SQL File
Analysis queries available in:
ZEPTO_SQL_ANALYSIS1.sql

👤 Author
Omkar Wagh
Data Analyst — SQL | Power BI | Python
