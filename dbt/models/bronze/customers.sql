{{ config(materialized='table') }}

select
    *,
    '{{ run_started_at }}' as _loaded_at
from read_files('/Volumes/semantic-demo-catalog/bronze/olist_csvs/olist_customers_dataset.csv', format => 'csv', header => true)
