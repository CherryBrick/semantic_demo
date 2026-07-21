{{ config(materialized='view') }}

select
    cast(order_id as string) as order_id,
    cast(customer_id as string) as customer_id,
    cast(order_purchase_timestamp as timestamp) as order_purchase_timestamp,
    cast(order_approved_at as timestamp) as order_approved_at,
    cast(order_delivered_carrier_date as timestamp) as order_delivered_carrier_date,
    cast(order_delivered_customer_date as timestamp) as order_delivered_customer_date,
    cast(order_estimated_delivery_date as timestamp) as order_estimated_delivery_date,
    lower(trim(order_status)) as order_status
from {{ source('bronze' 'orders') }}
