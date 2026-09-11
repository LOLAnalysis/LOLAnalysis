with source as (
    select * from {{ source('bq_raw', 'teamstats') }}
)

select
    matchid as match_id,
    teamid as team_id,
    firstblood as has_first_blood,
    firsttower as has_first_turret,       -- firsttower olarak güncellendi
    firstinhib as has_first_inhibitor,    -- firstinhib olarak güncellendi
    firstbaron as has_first_baron,
    firstdragon as has_first_dragon,
    firstharry as has_first_herald,       -- firstharry olarak güncellendi
    towerkills as tower_kills,
    inhibkills as inhibitor_kills,        -- inhibkills olarak güncellendi
    baronkills as baron_kills,
    dragonkills as dragon_kills,
    harrykills as herald_kills            -- harrykills olarak güncellendi
from source