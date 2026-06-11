select
    id as match_id,
    gameid,
    platformid,
    queueid,
    seasonid,
    duration as game_duration_seconds,
    creation as game_creation_ts,
    version as game_version
from `league-of-legend-498906.LOL.matches`