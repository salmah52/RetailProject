with source as (
      select * from {{ source('Online_Retail009', 'mainretail09') }}
),
renamed as (
    select
        {{ adapter.quote("InvoiceNo") }},
        {{ adapter.quote("StockCode") }},
        {{ adapter.quote("Description") }},
        {{ adapter.quote("Quantity") }},
        {{ adapter.quote("InvoiceDate") }},
        {{ adapter.quote("UnitPrice") }},
        {{ adapter.quote("CustomerID") }},
        {{ adapter.quote("Country") }}

    from source
)
select * from renamed
  