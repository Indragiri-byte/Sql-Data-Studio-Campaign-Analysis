# SQL Campaign Business Analysis

## Project Overview

This project analyzes marketing campaign performance using SQL and Google BigQuery. The analysis focuses on campaign efficiency, ROI, conversion rate, acquisition cost, campaign types, and marketing channels.

The objective is to transform raw campaign data into actionable business insights that can support marketing performance evaluation and decision-making.

## Tools & Technologies

* SQL
* Google BigQuery
* Git & GitHub

## Dataset

The dataset contains marketing campaign information including:

* Campaign ID
* Company
* Campaign Type
* Target Audience
* Duration
* Marketing Channel
* Conversion Rate
* Acquisition Cost
* ROI
* Location
* Language
* Clicks
* Impressions
* Engagement Score
* Customer Segment
* Campaign Date

## Analysis Performed

### 1. Data Cleaning & Standardization

* Standardized text fields using `TRIM()`
* Handled blank values using `NULLIF()`
* Replaced missing or blank categorical values with `Unknown` using `COALESCE()`
* Created standardized column aliases for analysis

### 2. Data Quality Checks

* Checked for duplicate Campaign IDs
* Identified missing or blank company values
* Identified unique campaign types
* Identified unique target audiences

### 3. Overall Campaign Performance

The analysis evaluates:

* Total number of marketing campaigns
* Average ROI by campaign type
* Average conversion rate by campaign type
* Average customer acquisition cost by campaign type
* Percentage of campaigns generating positive ROI

### 4. Campaign Type Analysis

Campaign types were compared based on:

* Average ROI
* Average conversion rate
* Average acquisition cost
* Campaign frequency
* Cost efficiency

### 5. Campaign Efficiency Analysis

An efficiency score was calculated to compare ROI relative to acquisition cost:

`Efficiency Score = ROI / Acquisition Cost`

The analysis identifies campaigns and campaign types that generate stronger returns relative to their acquisition costs.

### 6. Acquisition Cost vs ROI

Campaigns were categorized into:

* Below-average acquisition cost
* Above-average acquisition cost

Their average ROI was then compared to understand the relationship between acquisition cost and campaign performance.

### 7. Marketing Channel Efficiency

Marketing channels were evaluated based on:

* Number of campaigns
* Average ROI
* Average acquisition cost
* Cost efficiency

## Key Findings

Based on the SQL analysis:

* **Influencer** campaigns achieved the highest average ROI at approximately **5.0111**.
* **Influencer** campaigns also achieved the highest average conversion rate at approximately **0.0803**.
* **Email** campaigns had the lowest average acquisition cost at approximately **12,495.35**.
* **Search** campaigns had the highest campaign-type efficiency score at approximately **0.00040071**.
* **Website** was the most cost-efficient marketing channel with an efficiency score of approximately **0.00040152**.
* **100% of campaigns generated positive ROI** in the analyzed dataset.
* The dataset contains **200,000 campaigns**.

## Business Insights

The analysis suggests that campaign performance should not be evaluated using ROI alone. Combining ROI with acquisition cost provides a better view of cost efficiency.

Influencer campaigns performed strongly in terms of ROI and conversion rate, while Website and Search showed strong cost-efficiency performance.

These insights can help marketing teams evaluate where to allocate campaign budgets and identify channels or campaign types that provide stronger returns relative to acquisition costs.

## Repository Structure

```text
sql-campaign-analysis-project/
│
├── campaign_business_analysis.sql
└── README.md
```

## SQL Techniques Used

* `WITH` / Common Table Expressions (CTEs)
* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* `CASE`
* `COALESCE`
* `NULLIF`
* `TRIM`
* `COUNT`
* `COUNTIF`
* `AVG`
* `ROUND`
* `SAFE_DIVIDE`
* `CROSS JOIN`
* Subqueries

## Conclusion

This project demonstrates the use of SQL for marketing analytics and business decision-making. The analysis combines data cleaning, data quality validation, descriptive analytics, ROI analysis, and efficiency evaluation to identify opportunities for improving marketing campaign performance.
