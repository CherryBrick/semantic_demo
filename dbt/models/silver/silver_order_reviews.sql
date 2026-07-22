select
    cast(review_id as string) as review_id,
    cast(order_id as string) as order_id,
    cast(review_score as int) as review_score,
    cast(review_creation_date as timestamp) as review_creation_date,
    cast(review_answer_timestamp as timestamp) as review_answer_timestamp,
    trim(review_comment_title) as review_comment_title,
    trim(review_comment_message) as review_comment_message
from {{ source('bronze', 'order_reviews') }}
