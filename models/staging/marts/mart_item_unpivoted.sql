WITH base AS (

    SELECT *
    FROM {{ ref('mart_player_item_performance') }}

)

SELECT
    participant_id,
    champion_id,
    champion_name,
    role,
    position,
    win,
    item1 AS item_id,
    totdmgtochamp,
    dmgselfmit,
    goldearned,
    goldspent,
    kda,
    damage_per_gold,
    tankiness_per_gold
FROM base
WHERE item1 IS NOT NULL
AND item1 != 0

UNION ALL

SELECT
    participant_id,
    champion_id,
    champion_name,
    role,
    position,
    win,
    item2,
    totdmgtochamp,
    dmgselfmit,
    goldearned,
    goldspent,
    kda,
    damage_per_gold,
    tankiness_per_gold
FROM base
WHERE item2 IS NOT NULL
AND item2 != 0