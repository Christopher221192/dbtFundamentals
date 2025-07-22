{{ config(materialized='view') }} -- usualmente staging es una view

select
    PAYMENT_ID as payment_id,
    ORDER_ID as order_id,
    upper(PAYMENT_METHOD) as payment_method, -- ejemplo de estandarización
    STATUS as status,
    AMOUNT as amount,
    cast(CREATED as date) as created_date,
    _BATCHED_AT as batched_at
from {{ source('jaffle_shop', 'payments') }}
