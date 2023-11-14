-- dim_customer.sql

-- Create the dimension table
WITH dim_customer AS (
	SELECT DISTINCT
	    {{ dbt_utils.generate_surrogate_key(['CustomerID', 'Country']) }} as customer_id,
	    Country AS country
	FROM   {{ source('Online_Retail009', 'mainretail09') }}
	WHERE CustomerID IS NOT NULL
)

SELECT
    t.*,
	cm.iso
FROM dim_customer t
LEFT JOIN {{ source('Online_Retail009', 'country') }} cm ON t.country = cm.nicename

