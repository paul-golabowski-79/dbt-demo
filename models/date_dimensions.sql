WITH

CTE AS (
    select
        started_at AS started_at_ori,
        TO_TIMESTAMP(started_at) AS started_at,
        DATE(TO_TIMESTAMP(started_at)) AS date_started_at,
        HOUR(TO_TIMESTAMP(started_at)) AS hour_started_at,
        CASE
            WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat', 'Sun') THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS DAY_TYPE,
        CASE
            WHEN MONTH(TO_TIMESTAMP(started_at)) IN (1, 2, 12) THEN 'WINTER'
            WHEN MONTH(TO_TIMESTAMP(started_at)) IN (3, 4, 5) THEN 'SPRING'
            WHEN MONTH(TO_TIMESTAMP(started_at)) IN (6, 7, 8) THEN 'SUMMER'
            ELSE 'AUTUMN'
        END AS SEASON_OF_YEAR
    from
        {{ source('demo', 'bike') }}
    where
        started_at != 'started_at'
)

select
    *
from
    CTE