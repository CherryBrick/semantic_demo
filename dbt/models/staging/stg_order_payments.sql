{{ config(materialized='view') }}

select
    cast(order_id as string) as order_id,
    cast(payment_sequential as int) as payment_sequential,
    cast(payment_installments as int) as payment_installments,
    cast(payment_value as decimal(10, 2)) as payment_value,
    lower(trim(payment_type)) as payment_type
from {{ source('bronze', 'order_payments') }}
