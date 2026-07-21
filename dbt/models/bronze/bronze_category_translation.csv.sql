{{ config(materialized='table') }}

select
    *,
    '{{ run_started_at }}' as _loaded_at
from csv.`/Volumes/main/raw/files/product_category_name_translation.csv`
