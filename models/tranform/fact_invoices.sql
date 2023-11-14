-- fct_invoices.sql

-- Create the fact table by joining the relevant keys from dimension table
WITH fact_invoices AS (
    SELECT
        InvoiceNo AS invoice_id,
        InvoiceDate AS datetime_id,
        {{ dbt_utils.generate_surrogate_key(['StockCode', 'Description', 'UnitPrice']) }} as product_id,
        {{ dbt_utils.generate_surrogate_key(['CustomerID', 'Country']) }} as customer_id,
        Quantity AS quantity,
        Quantity * UnitPrice AS total
         FROM {{ source('Online_Retail009', 'mainretail09') }}
   
    WHERE Quantity > 0
)
SELECT
    invoice_id,
    dt.datetime_id,
    dp.product_id,
    dc.customer_id,
    quantity,
    total
FROM fact_invoices fi
INNER JOIN {{ ref('dim_date') }} dt ON fi.datetime_id = dt.datetime_id
INNER JOIN {{ ref('dim_product') }} dp ON fi.product_id = dp.product_id
INNER JOIN {{ ref('dim_customer') }} dc ON fi.customer_id = dc.customer_id