{{ config(materialized='table') }}

select
    *,
    '{{ run_started_at }}' as _loaded_at
from csv.`/Volumes/main/raw/files/olist_products_dataset.csv`
