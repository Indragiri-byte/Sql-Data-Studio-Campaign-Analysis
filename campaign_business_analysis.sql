
-- ============================================================
-- CAMPAIGN BUSINESS ANALYSIS
-- ============================================================
-- Project: Marketing Campaign Performance Analysis
-- Database: Google BigQuery
--
-- Objectives:
--   1. Data cleaning and validation
--   2. Overall campaign performance analysis
--   3. Campaign type analysis
--   4. Campaign efficiency analysis
--   5. Acquisition cost vs ROI analysis
--   6. Marketing channel efficiency analysis
--   7. Final business summary
-- ============================================================


-- ============================================================
-- 1. DATA CLEANING AND STANDARDIZATION
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        Campaign_ID AS campaign_id,

        COALESCE(
            NULLIF(TRIM(Company), ''),
            'Unknown'
        ) AS company,

        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        COALESCE(
            NULLIF(TRIM(Target_Audience), ''),
            'Unknown'
        ) AS target_audience,

        Duration AS duration,

        COALESCE(
            NULLIF(TRIM(Channel_Used), ''),
            'Unknown'
        ) AS channel_used,

        Conversion_Rate AS conversion_rate,
        Acquisition_Cost AS acquisition_cost,
        ROI AS roi,

        COALESCE(
            NULLIF(TRIM(Location), ''),
            'Unknown'
        ) AS location,

        COALESCE(
            NULLIF(TRIM(Language), ''),
            'Unknown'
        ) AS language,

        Clicks AS clicks,
        Impressions AS impressions,
        Engagement_Score AS engagement_score,

        COALESCE(
            NULLIF(TRIM(Customer_Segment), ''),
            'Unknown'
        ) AS customer_segment,

        Date AS campaign_date

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT *
FROM cleaned_campaign_data;


-- ============================================================
-- 2. DATA QUALITY CHECKS
-- ============================================================


-- ============================================================
-- 2.1 CHECK FOR DUPLICATE CAMPAIGN IDs
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        Campaign_ID AS campaign_id

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_id,
    COUNT(*) AS campaign_count

FROM cleaned_campaign_data

GROUP BY campaign_id

HAVING COUNT(*) > 1

ORDER BY campaign_count DESC;


-- ============================================================
-- 2.2 CHECK FOR MISSING OR BLANK COMPANY VALUES
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        Campaign_ID AS campaign_id,

        COALESCE(
            NULLIF(TRIM(Company), ''),
            'Unknown'
        ) AS company

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT *
FROM cleaned_campaign_data
WHERE company = 'Unknown';


-- ============================================================
-- 2.3 IDENTIFY UNIQUE CAMPAIGN TYPES
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT DISTINCT
    campaign_type

FROM cleaned_campaign_data

ORDER BY campaign_type;


-- ============================================================
-- 2.4 IDENTIFY UNIQUE TARGET AUDIENCES
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Target_Audience), ''),
            'Unknown'
        ) AS target_audience

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT DISTINCT
    target_audience

FROM cleaned_campaign_data

ORDER BY target_audience;


-- ============================================================
-- 3. OVERALL CAMPAIGN PERFORMANCE
-- ============================================================


-- ============================================================
-- 3.1 TOTAL NUMBER OF MARKETING CAMPAIGNS
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        Campaign_ID AS campaign_id

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    COUNT(*) AS total_campaigns

FROM cleaned_campaign_data;


-- ============================================================
-- 3.2 AVERAGE ROI BY CAMPAIGN TYPE
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        ROI AS roi

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_type,

    ROUND(
        AVG(roi),
        4
    ) AS average_roi

FROM cleaned_campaign_data

GROUP BY campaign_type

ORDER BY average_roi DESC;


-- ============================================================
-- 3.3 AVERAGE CONVERSION RATE BY CAMPAIGN TYPE
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        Conversion_Rate AS conversion_rate

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_type,

    ROUND(
        AVG(conversion_rate),
        4
    ) AS average_conversion_rate

FROM cleaned_campaign_data

GROUP BY campaign_type

ORDER BY average_conversion_rate DESC;


-- ============================================================
-- 3.4 AVERAGE CUSTOMER ACQUISITION COST BY CAMPAIGN TYPE
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        Acquisition_Cost AS acquisition_cost

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_type,

    ROUND(
        AVG(acquisition_cost),
        0
    ) AS average_acquisition_cost

FROM cleaned_campaign_data

GROUP BY campaign_type

ORDER BY average_acquisition_cost ASC;


-- ============================================================
-- 3.5 PERCENTAGE OF CAMPAIGNS GENERATING POSITIVE ROI
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        ROI AS roi

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(roi > 0),
            COUNT(*)
        ) * 100,
        2
    ) AS positive_roi_percentage

FROM cleaned_campaign_data;


-- ============================================================
-- 4. CAMPAIGN TYPE ANALYSIS
-- ============================================================


-- ============================================================
-- 4.1 CAMPAIGN TYPE WITH THE HIGHEST AVERAGE ROI
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        ROI AS roi

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_type,

    ROUND(
        AVG(roi),
        2
    ) AS average_roi

FROM cleaned_campaign_data

GROUP BY campaign_type

ORDER BY average_roi DESC

LIMIT 1;


-- ============================================================
-- 4.2 CAMPAIGN TYPE WITH THE HIGHEST AVERAGE CONVERSION RATE
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        Conversion_Rate AS conversion_rate

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_type,

    ROUND(
        AVG(conversion_rate),
        4
    ) AS average_conversion_rate

FROM cleaned_campaign_data

GROUP BY campaign_type

ORDER BY average_conversion_rate DESC

LIMIT 1;


-- ============================================================
-- 4.3 CAMPAIGN TYPES WITH THE LOWEST ACQUISITION COST
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        Acquisition_Cost AS acquisition_cost

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_type,

    ROUND(
        AVG(acquisition_cost),
        0
    ) AS average_acquisition_cost

FROM cleaned_campaign_data

GROUP BY campaign_type

ORDER BY average_acquisition_cost ASC

LIMIT 5;


-- ============================================================
-- 4.4 MOST FREQUENTLY USED CAMPAIGN TYPES
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_type,

    COUNT(*) AS total_campaigns

FROM cleaned_campaign_data

GROUP BY campaign_type

ORDER BY total_campaigns DESC;


-- ============================================================
-- 5. CAMPAIGN EFFICIENCY ANALYSIS
-- ============================================================


-- ============================================================
-- 5.1 CAMPAIGNS WITH THE HIGHEST ROI RELATIVE TO
--     ACQUISITION COST
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        Campaign_ID AS campaign_id,

        COALESCE(
            NULLIF(TRIM(Company), ''),
            'Unknown'
        ) AS company,

        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        Acquisition_Cost AS acquisition_cost,
        ROI AS roi

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_id,
    company,
    campaign_type,
    acquisition_cost,
    roi,

    ROUND(
        SAFE_DIVIDE(
            roi,
            acquisition_cost
        ),
        4
    ) AS efficiency_score

FROM cleaned_campaign_data

WHERE acquisition_cost IS NOT NULL
  AND acquisition_cost > 0

ORDER BY efficiency_score DESC

LIMIT 5;


-- ============================================================
-- 5.2 CAMPAIGNS WITH HIGH CONVERSION RATE AND
--     HIGH ACQUISITION COST
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        Campaign_ID AS campaign_id,

        COALESCE(
            NULLIF(TRIM(Company), ''),
            'Unknown'
        ) AS company,

        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        Acquisition_Cost AS acquisition_cost,
        Conversion_Rate AS conversion_rate

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
),

campaign_averages AS (
    SELECT
        AVG(acquisition_cost) AS avg_acquisition_cost,
        AVG(conversion_rate) AS avg_conversion_rate

    FROM cleaned_campaign_data
)

SELECT
    c.campaign_id,
    c.company,
    c.campaign_type,
    c.acquisition_cost,
    c.conversion_rate

FROM cleaned_campaign_data c

CROSS JOIN campaign_averages a

WHERE c.acquisition_cost > a.avg_acquisition_cost
  AND c.conversion_rate > a.avg_conversion_rate

ORDER BY c.conversion_rate DESC;


-- ============================================================
-- 6. ACQUISITION COST VS ROI
-- ============================================================


-- ============================================================
-- 6.1 COMPARE ROI BETWEEN CAMPAIGNS WITH ABOVE-AVERAGE
--     AND BELOW-AVERAGE ACQUISITION COST
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        Acquisition_Cost AS acquisition_cost,
        ROI AS roi

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
),

average_cost AS (
    SELECT
        AVG(acquisition_cost) AS avg_acquisition_cost

    FROM cleaned_campaign_data
)

SELECT

    CASE
        WHEN c.acquisition_cost < a.avg_acquisition_cost
            THEN 'Below Average'
        ELSE 'Above Average'
    END AS acquisition_cost_category,

    c.campaign_type,

    ROUND(
        AVG(c.roi),
        2
    ) AS average_roi

FROM cleaned_campaign_data c

CROSS JOIN average_cost a

GROUP BY
    acquisition_cost_category,
    c.campaign_type

ORDER BY
    acquisition_cost_category,
    average_roi DESC;


-- ============================================================
-- 7. BEST CAMPAIGN TYPE FOR COST EFFICIENCY
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        Acquisition_Cost AS acquisition_cost,
        ROI AS roi

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    campaign_type,

    COUNT(*) AS total_campaigns,

    ROUND(
        AVG(roi),
        4
    ) AS average_roi,

    ROUND(
        AVG(acquisition_cost),
        2
    ) AS average_acquisition_cost,

    ROUND(
        SAFE_DIVIDE(
            AVG(roi),
            AVG(acquisition_cost)
        ),
        8
    ) AS efficiency_score

FROM cleaned_campaign_data

GROUP BY campaign_type

ORDER BY efficiency_score DESC;


-- ============================================================
-- 8. BEST MARKETING CHANNEL FOR COST EFFICIENCY
-- ============================================================

WITH cleaned_campaign_data AS (
    SELECT
        COALESCE(
            NULLIF(TRIM(Channel_Used), ''),
            'Unknown'
        ) AS channel_used,

        Acquisition_Cost AS acquisition_cost,
        ROI AS roi

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
)

SELECT
    channel_used,

    COUNT(*) AS total_campaigns,

    ROUND(
        AVG(roi),
        4
    ) AS average_roi,

    ROUND(
        AVG(acquisition_cost),
        2
    ) AS average_acquisition_cost,

    ROUND(
        SAFE_DIVIDE(
            AVG(roi),
            AVG(acquisition_cost)
        ),
        8
    ) AS efficiency_score

FROM cleaned_campaign_data

GROUP BY channel_used

ORDER BY efficiency_score DESC;


-- ============================================================
-- 9. FINAL BUSINESS SUMMARY
-- ============================================================

WITH cleaned_campaign_data AS (

    SELECT
        Campaign_ID AS campaign_id,

        COALESCE(
            NULLIF(TRIM(Campaign_type), ''),
            'Unknown'
        ) AS campaign_type,

        COALESCE(
            NULLIF(TRIM(Channel_Used), ''),
            'Unknown'
        ) AS channel_used,

        Conversion_Rate AS conversion_rate,
        Acquisition_Cost AS acquisition_cost,
        ROI AS roi

    FROM `project-6f5de728-8d39-4494-911.Sql_campaignexcercise1.Sql_campaignexcercise1`
),

campaign_type_analysis AS (

    SELECT
        campaign_type,

        AVG(roi) AS average_roi,

        AVG(conversion_rate) AS average_conversion_rate,

        AVG(acquisition_cost) AS average_acquisition_cost,

        SAFE_DIVIDE(
            AVG(roi),
            AVG(acquisition_cost)
        ) AS efficiency_score

    FROM cleaned_campaign_data

    GROUP BY campaign_type
),

channel_analysis AS (

    SELECT
        channel_used,

        SAFE_DIVIDE(
            AVG(roi),
            AVG(acquisition_cost)
        ) AS efficiency_score

    FROM cleaned_campaign_data

    GROUP BY channel_used
),

overall_analysis AS (

    SELECT
        COUNT(*) AS total_campaigns,

        ROUND(
            SAFE_DIVIDE(
                COUNTIF(roi > 0),
                COUNT(*)
            ) * 100,
            2
        ) AS positive_roi_percentage

    FROM cleaned_campaign_data
)

SELECT

    o.total_campaigns,

    o.positive_roi_percentage,

    (
        SELECT campaign_type
        FROM campaign_type_analysis
        ORDER BY average_roi DESC
        LIMIT 1
    ) AS highest_roi_campaign_type,

    (
        SELECT ROUND(average_roi, 4)
        FROM campaign_type_analysis
        ORDER BY average_roi DESC
        LIMIT 1
    ) AS highest_average_roi,

    (
        SELECT campaign_type
        FROM campaign_type_analysis
        ORDER BY average_conversion_rate DESC
        LIMIT 1
    ) AS highest_conversion_campaign_type,

    (
        SELECT ROUND(average_conversion_rate, 4)
        FROM campaign_type_analysis
        ORDER BY average_conversion_rate DESC
        LIMIT 1
    ) AS highest_average_conversion_rate,

    (
        SELECT campaign_type
        FROM campaign_type_analysis
        ORDER BY average_acquisition_cost ASC
        LIMIT 1
    ) AS lowest_cost_campaign_type,

    (
        SELECT ROUND(average_acquisition_cost, 2)
        FROM campaign_type_analysis
        ORDER BY average_acquisition_cost ASC
        LIMIT 1
    ) AS lowest_average_acquisition_cost,

    (
        SELECT campaign_type
        FROM campaign_type_analysis
        ORDER BY efficiency_score DESC
        LIMIT 1
    ) AS most_cost_efficient_campaign_type,

    (
        SELECT ROUND(efficiency_score, 8)
        FROM campaign_type_analysis
        ORDER BY efficiency_score DESC
        LIMIT 1
    ) AS campaign_type_efficiency_score,

    (
        SELECT channel_used
        FROM channel_analysis
        ORDER BY efficiency_score DESC
        LIMIT 1
    ) AS most_cost_efficient_channel,

    (
        SELECT ROUND(efficiency_score, 8)
        FROM channel_analysis
        ORDER BY efficiency_score DESC
        LIMIT 1
    ) AS channel_efficiency_score

FROM overall_analysis o;


-- ============================================================
-- END OF CAMPAIGN BUSINESS ANALYSIS
-- ============================================================
