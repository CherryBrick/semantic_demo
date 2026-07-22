select
    *,
    '{{ run_started_at }}' as _loaded_at
from read_files('/Volumes/semantic-demo-catalog/bronze/olist_csvs/olist_order_payments_dataset.csv', format => 'csv', header => true)
