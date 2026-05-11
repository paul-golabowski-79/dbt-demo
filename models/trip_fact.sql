WITH

trips AS (
select
    ride_id,
    rideable_type,
    DATE(to_timestamp(started_at)) AS trip_date,
    start_station_id,
    end_station_id,
    member_csual AS member_casual,
    TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(started_at), TO_TIMESTAMP(ended_at)) AS trip_duration_seconds
from
    {{source('demo', 'bike')}}
where
    ride_id != 'ride_id'
)

select
    *
from
    trips