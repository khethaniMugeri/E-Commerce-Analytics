# E-Commerce-Analytics
E-Commerce Analytics Dashboard using SQL and Power BI
# 🛒 E-Commerce Analytics Dashboard (SQL + Power BI)

![Project Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Tools](https://img.shields.io/badge/Tools-SQL%20%7C%20Power%20BI-blue)
![Domain](https://img.shields.io/badge/Domain-E--Commerce%20Analytics-orange)

## 📌 Project Overview

This project analyses the behaviour of **8,000 e-commerce website visitors** to uncover key insights around purchasing behaviour, device performance, and product engagement. The analysis was conducted using **SQL Server** for data extraction and **Power BI** for interactive dashboard visualisation.

The dataset contains numerical and Catergorical  features which are : 

<h3>Table 1 — Numerical Features Used in the User Behavior Analysis Model</h3>
<table border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse; width: 100%;">
    <thead>
        <tr style="background-color: #2E75B6; color: white;">
            <th>Feature Name</th>
            <th>Feature Description</th>
            <th>Min</th>
            <th>Max</th>
            <th>SD</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Administrative</td>
            <td>Number of pages visited about account management</td>
            <td>0</td><td>27</td><td>3.32</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>Administrative Duration</td>
            <td>Time (seconds) spent on account management pages</td>
            <td>0</td><td>3398</td><td>176.70</td>
        </tr>
        <tr>
            <td>Informational</td>
            <td>Number of pages visited about site information</td>
            <td>0</td><td>24</td><td>1.26</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>Informational Duration</td>
            <td>Time (seconds) spent on informational pages</td>
            <td>0</td><td>2549</td><td>140.64</td>
        </tr>
        <tr>
            <td>Product Related</td>
            <td>Number of product related pages visited</td>
            <td>0</td><td>705</td><td>44.45</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>Product Related Duration</td>
            <td>Time (seconds) spent on product related pages</td>
            <td>0</td><td>63,973</td><td>1912.25</td>
        </tr>
        <tr>
            <td>Bounce Rate</td>
            <td>Average bounce rate of pages visited</td>
            <td>0</td><td>0.2</td><td>0.04</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>Exit Rate</td>
            <td>Average exit rate of pages visited</td>
            <td>0</td><td>0.2</td><td>0.05</td>
        </tr>
        <tr>
            <td>Page Value</td>
            <td>Average page value of pages visited</td>
            <td>0</td><td>361</td><td>18.55</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>Special Day</td>
            <td>Closeness of visit time to a special day</td>
            <td>0</td><td>1.0</td><td>0.19</td>
        </tr>
    </tbody>
</table>

<h3>Table 2 — Categorical Features Used in the User Behavior Analysis Model</h3>
<table border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse; width: 100%;">
    <thead>
        <tr style="background-color: #2E75B6; color: white;">
            <th>Feature Name</th>
            <th>Feature Description</th>
            <th>Number of Categories</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>OperatingSystems</td>
            <td>Operating system of the visitor</td>
            <td>8</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>Browser</td>
            <td>Browser of the visitor</td>
            <td>13</td>
        </tr>
        <tr>
            <td>Region</td>
            <td>Geographic region of the visitor</td>
            <td>9</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>TrafficType</td>
            <td>Traffic source (banner, SMS, direct etc.)</td>
            <td>20</td>
        </tr>
        <tr>
            <td>VisitorType</td>
            <td>New Visitor, Returning Visitor, or Other</td>
            <td>3</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>Weekend</td>
            <td>Whether the visit was on a weekend</td>
            <td>2</td>
        </tr>
        <tr>
            <td>Month</td>
            <td>Month of the visit date</td>
            <td>12</td>
        </tr>
        <tr style="background-color: #f2f2f2;">
            <td>Revenue</td>
            <td>Whether visit ended with a transaction</td>
            <td>2</td>
        </tr>
    </tbody>
</table>

---

## 🎯 Business Questions Answered

- What is the overall conversion rate of the website?
- Which months gives the most purchases?
-  Do people mostly complete the transaction on Weekends or Weekdays?
- Who buys more between the different types of website  visitors?
- Does viewing more products increase the likelihood of buying?
- Which browsers and operating systems have the highest conversion rates?
- Do buyers spend more time on the website than non-buyers?
- Does proximity to special days affect purchasing behaviour?
- Are purchases more likely on weekdays or weekends?
- Do visitors who read more Informational pages buy more?
- Purchase probability by month and visitor type

---

## 🗂️ Project Structure

```
E-Commerce-Analytics/
│
├── SQL/
│   └── ecommerce_analytics.sql       # All SQL queries used in the analysis
│
├── Dashboard/
│   └── E-Commerce_Analytics.pbix     # Power BI dashboard file
│
├── Data/
│   └── online_shopping_train.csv     # Dataset used in the project
│
└── README.md                         # Project documentation
```

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| SQL Server | Data ingestion, table creation, KPI extraction |
| Power BI Desktop | Interactive dashboard and data visualisation |
| DAX | Custom measures and calculated columns |
| Power Query | Data transformation and type corrections |

---

## 📊 Dashboard Pages

### Page 1 — Overview
High level summary of key metrics:
- Total Visitors (8,000)
- Conversion Rate (15.33%)
- Purchases by Month (bar chart)
- Weekend vs Weekday Purchases (donut chart)
- Buyers vs Non-Buyers breakdown (donut chart)

### Page 2 — Website Visitor Behaviour
Deep dive into how different visitors interact with the site:
- Conversion Rate by Visitor Type
- Product Engagement vs Conversion Rate
- Purchase Probability Heatmap by Month and Visitor Type
- Customer Purchase Journey Funnel

### Page 3 — Device Performance
Analysis of how device and browser choice affects purchasing:
- Conversion Rate by Browser (treemap)
- Conversion Rate by Operating System (donut chart)
- Average Page Value: Buyers vs Non-Buyers
- Average Time Spent on Site in Minutes (buyers vs non-buyers)

### Page 4 — Product & Behavioural Analytics
Deeper behavioural insights:
- Special Day Effect on Conversion Rate (line chart)
- Exit Rate vs Conversion Rate
- Product Engagement vs Conversion Rate
- Purchases by Product Engagement Level (donut chart)

---

## 🔍 Key Findings

- Only **15.33%** of visitors make a purchase — 84.67% leave without buying
- **November** is the highest purchasing month — likely driven by Black Friday
- **New visitors** convert at a higher rate (~24%) than returning visitors (~14%)
- **Buyers spend 31 minutes** on the site vs 18 minutes for non-buyers
- Visitors who view **10 or products** are significantly more likely to purchase
- **Low exit rate** visitors convert at nearly 28% — high exit rate visitors rarely buy
- **74% of purchases** happen on weekdays — n
- Conversion rate is **highest on normal days** (SpecialDay = 0) — proximity to special days does not improve conversion
- Visitore who use browser 5 and 10 are more likely to purchase
- Visitors who use operating system 2 and 4 are more likely purchase
- Visitors who read 10 or informational pages convert at 40% vs only 13% for those who read none
---

## 🗄️ SQL Highlights

```sql
-- Conversion Rate
SELECT COUNT(CASE WHEN Revenue = 1 THEN 1 END) * 100.0 / COUNT(*) AS Revenue_Rate
FROM EcommerceAnalytics_dat;

-- Product Engagement vs Conversion
SELECT 
    CASE 
        WHEN ProductRelated <= 10 THEN 'Low Views'
        WHEN ProductRelated <= 30 THEN 'Medium Views'
        ELSE 'High Views'
    END AS Product_Engagement,
    SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Conversion_Rate
FROM EcommerceAnalytics_dat
GROUP BY 
    CASE 
        WHEN ProductRelated <= 10 THEN 'Low Views'
        WHEN ProductRelated <= 30 THEN 'Medium Views'
        ELSE 'High Views'
    END;

-- Time Spent: Buyers vs Non-Buyers
SELECT AVG(ProductRelated_Duration) AS Avg_Time_Buyers
FROM EcommerceAnalytics_dat WHERE Revenue = 1;

SELECT AVG(ProductRelated_Duration) AS Avg_Time_NonBuyers
FROM EcommerceAnalytics_dat WHERE Revenue = 0;
```

---

## 📁 Dataset

**Source:** UCI Machine Learning Repository — Online Shoppers Purchasing Intention Dataset

**Size:** 8,000 rows × 16 columns

**Key columns:**

| Column | Description |
|---|---|
| Administrative | Number of administrative pages visited |
| ProductRelated | Number of product pages visited |
| BounceRates | Bounce rate of the visited page |
| ExitRates | Exit rate of the visited page |
| PageValues | Average value of the page |
| SpecialDay | Closeness to a special day (0–1) |
| Month | Month of the visit |
| VisitorType | New, Returning, or Other |
| Weekend | Whether the visit was on a weekend |
| Revenue | Whether a transaction was completed (target variable) |

---

## 🚀 How to Run This Project

### SQL Setup
1. Open **SQL Server Management Studio (SSMS)**
2. Create a new database
3. Run the script in `SQL/ecommerce_analytics.sql`
4. Update the file path in the `BULK INSERT` statement to match your local CSV location

### Power BI Setup
1. Open **Power BI Desktop**
2. Open `Dashboard/E-Commerce_Analytics_Dashboard.pbix`
3. If data doesn't load, go to **Home → Transform Data → Data Source Settings** and update the CSV file path

---

## 👤 Author

**Khethani Mugeri**

- 📧 Connect with me on LinkedIn
- 🌐 Portfolio Website *(coming soon)*

---

## 📌 Note

This project was built as part of a personal data analytics portfolio to demonstrate proficiency in SQL, Power BI, DAX, and business intelligence reporting.
