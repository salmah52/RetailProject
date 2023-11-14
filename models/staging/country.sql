with source as (
      select * from {{ source('Online_Retail009', 'country') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("iso") }},
        {{ adapter.quote("name") }},
        {{ adapter.quote("nicename") }},
        {{ adapter.quote("iso3") }},
        {{ adapter.quote("numcode") }},
        {{ adapter.quote("phonecode") }}

    from source
)
select * from renamed
  