SELECT
    id AS participant_id,
    matchid AS match_id,
    player,
    championid AS champion_id,
    role,
    position
FROM {{ source('lol_raw', 'participants') }}