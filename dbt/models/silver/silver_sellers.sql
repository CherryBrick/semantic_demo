select
    cast(seller_id as string) as seller_id,
    cast(seller_zip_code_prefix as int) as seller_zip_code_prefix,
    lower(trim(seller_city)) as seller_city,
    upper(trim(seller_state)) as seller_state
from {{ source('bronze', 'sellers') }}
