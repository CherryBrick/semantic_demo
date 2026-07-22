{% test max_invalid_int(model, column_name, max_ratio) %}

with stats as (

    select
        count(*) as total_rows,
        sum(
            case
                when try_cast({{ column_name }} as int) is null then 1
                else 0
            end
        ) as bad_rows
    from {{ model }}

)

select *
from stats
where bad_rows > total_rows * {{ max_ratio }}

{% endtest %}
