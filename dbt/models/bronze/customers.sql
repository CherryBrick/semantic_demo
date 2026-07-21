{{ config(materialized='table') }}

select
    *,
    '{{ run_started_at }}' as _loaded_at
from csv.`/Volumes/semantic-demo-catalog/bronze/olist_csvs/olist_customers_dataset.csv` (header => true)
