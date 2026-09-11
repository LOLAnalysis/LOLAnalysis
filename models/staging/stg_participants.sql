with source as (
    select * from {{ source('bq_raw', 'participants') }}
)

select
    id as participant_id,
    matchid as match_id,
    player as player_slot,  -- 1-5 mavi, 6-10 kırmızı takım
    championid as champion_id,
    role,
    position
from source