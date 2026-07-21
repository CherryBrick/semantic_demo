{{ config(materialized='view') }}

select
    cast(geolocation_zip_code_prefix as int) as geolocation_zip_code_prefix,
    cast(geolocation_lat as decimal(10, 6)) as geolocation_lat,
    cast(geolocation_lng as decimal(10, 6)) as geolocation_lng,
    lower(trim(geolocation_city)) as geolocation_city,
    upper(trim(geolocation_state)) as geolocation_state
from {{ source('bronze' 'geolocation') }}
