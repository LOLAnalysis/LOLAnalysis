with source as (
    select * from {{ source('bq_raw', 'matches') }}
)

select
    id as match_id,
    gameid as game_id,
    platformid as platform_id,
    queueid as queue_id,
    seasonid as season_id,
    duration as match_duration_seconds,
    creation as match_creation_timestamp,
    version as game_version
from source