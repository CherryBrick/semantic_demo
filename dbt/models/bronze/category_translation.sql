select
    *,
    '{{ run_started_at }}' as _loaded_at
from read_files('/Volumes/semantic-demo-catalog/bronze/olist_csvs/product_category_name_translation.csv', format => 'csv', header => true)
