WITH cte AS (
select
    t.*,
    w.*
from
    {{ ref('trip_fact') }} AS t
left join
    {{ ref('daily_weather') }} AS w
    on
        w.daily_weather = t.trip_date
)

select
    *
from
    cte