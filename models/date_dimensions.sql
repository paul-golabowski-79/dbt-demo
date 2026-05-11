WITH

CTE AS (
    select
        started_at AS started_at_ori,
        TO_TIMESTAMP(started_at) AS started_at,
        DATE(TO_TIMESTAMP(started_at)) AS date_started_at,
        HOUR(TO_TIMESTAMP(started_at)) AS hour_started_at,
        {{day_type('started_at')}} AS DAY_TYPE,
        {{season_of_year('started_at')}} AS SEASON_OF_YEAR
    from
        {{ source('demo', 'bike') }}
    where
        started_at != 'started_at'
)

select
    *
from
    CTE