\# Marketing Campaign Business Analysis



\## Project Overview



This project analyzes marketing campaign performance using SQL in Google BigQuery. The analysis focuses on campaign performance, campaign type effectiveness, acquisition cost, ROI, and marketing channel efficiency.



\## Objectives



\* Perform data cleaning and standardization

\* Validate data quality

\* Analyze overall campaign performance

\* Compare campaign types based on ROI and conversion rate

\* Analyze customer acquisition cost

\* Evaluate campaign cost efficiency

\* Compare acquisition cost against ROI

\* Identify the most cost-efficient marketing channel



\## Tools \& Technologies



\* Google BigQuery

\* SQL

\* Google Looker Studio

\* GitHub



\## Analysis Covered



\### 1. Data Cleaning \& Standardization



Standardized text fields and replaced blank values with `Unknown` to improve data consistency.



\### 2. Data Quality Checks



\* Duplicate Campaign ID detection

\* Missing and blank value checks

\* Unique campaign type identification

\* Unique target audience identification



\### 3. Overall Campaign Performance



\* Total number of campaigns

\* Average ROI by campaign type

\* Average conversion rate by campaign type

\* Average acquisition cost by campaign type

\* Percentage of campaigns generating positive ROI



\### 4. Campaign Type Analysis



\* Campaign type with the highest average ROI

\* Campaign type with the highest average conversion rate

\* Campaign types with the lowest acquisition cost

\* Most frequently used campaign types



\### 5. Campaign Efficiency Analysis



\* Campaigns with the highest ROI relative to acquisition cost

\* Campaigns with both high conversion rate and high acquisition cost



\### 6. Acquisition Cost vs ROI



Compared campaign performance between campaigns with above-average and below-average acquisition costs.



\### 7. Cost Efficiency Analysis



Identified the most cost-efficient campaign type based on the relationship between average ROI and average acquisition cost.



\### 8. Marketing Channel Efficiency



Compared marketing channels based on average ROI, average acquisition cost, and efficiency score.



\## Key Findings



Based on the analysis:



\* \*\*Influencer\*\* campaigns achieved the highest average ROI at approximately \*\*5.0111\*\*.

\* \*\*Influencer\*\* campaigns also achieved the highest average conversion rate at approximately \*\*0.0803\*\*.

\* \*\*Email\*\* campaigns had the lowest average acquisition cost at approximately \*\*12,495.35\*\*.

\* \*\*Search\*\* was the most cost-efficient campaign type with an efficiency score of approximately \*\*0.00040071\*\*.

\* \*\*Website\*\* was the most cost-efficient marketing channel with an efficiency score of approximately \*\*0.00040152\*\*.

\* \*\*100% of campaigns generated positive ROI\*\* in the analyzed dataset.

\* The dataset contains \*\*200,000 campaigns\*\*.



\## Interactive Dashboard



Explore the interactive marketing campaign dashboard created using Google Looker Studio:



\[Open Google Looker Studio Dashboard](https://datastudio.google.com/reporting/86b0ac94-3be1-492d-8f60-dd295fa9b621/page/GCB5F)



\## SQL Analysis



The complete SQL analysis is available in:



`campaign\_business\_analysis.sql`



\## Repository Structure



```text

sql-campaign-analysis-project/

│

├── campaign\_business\_analysis.sql

└── README.md

```



\## Author



Indragiri-byte



