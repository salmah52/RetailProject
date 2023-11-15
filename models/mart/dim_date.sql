-- dim_datetime.sql

-- Create a CTE to extract date and time components
WITH dim_date AS (  
  SELECT DISTINCT
    InvoiceDate AS datetime_id
  FROM {{ source('Online_Retail009', 'mainretail09') }}
  WHERE InvoiceDate IS NOT NULL
)

SELECT
  datetime_id,

  EXTRACT(YEAR FROM datetime_id) AS year,
  EXTRACT(MONTH FROM datetime_id) AS month,
  EXTRACT(DAY FROM datetime_id) AS day,
  EXTRACT(HOUR FROM datetime_id) AS hour,
  EXTRACT(MINUTE FROM datetime_id) AS minute,
  EXTRACT(DAYOFWEEK FROM datetime_id) AS weekday,
  FORMAT_DATE('%A', datetime_id) AS weekday2,
  EXTRACT(QUARTER FROM datetime_id) AS quarter,
  EXTRACT(WEEK FROM datetime_id) AS week_number,
  CASE WHEN EXTRACT(DAYOFWEEK FROM datetime_id) IN (1, 7) THEN 'Weekend' ELSE 'Weekday' END AS weekday_weekend,
        CASE WHEN EXTRACT(DAY FROM datetime_id) IN (1, 2, 3) AND EXTRACT(MONTH FROM datetime_id) = 12 THEN 'Holiday' ELSE 'Non-Holiday' END AS holiday,
        IF(EXTRACT(MONTH FROM datetime_id) = 2 AND MOD(EXTRACT(YEAR FROM datetime_id), 4) = 0, 'Leap Year', 'Non-Leap Year') AS leap_year,
        CASE
        WHEN EXTRACT(MONTH FROM datetime_id) IN (12, 1, 2) THEN 'Winter'
        WHEN EXTRACT(MONTH FROM datetime_id) IN (3, 4, 5) THEN 'Spring'
        WHEN EXTRACT(MONTH FROM datetime_id) IN (6, 7, 8) THEN 'Summer'
        WHEN EXTRACT(MONTH FROM datetime_id) IN (9, 10, 11) THEN 'Fall'
        ELSE 'Unknown'
        END AS season
  --LENGTH(CAST(datetime_id AS STRING)) AS timestamp_length
FROM dim_date
