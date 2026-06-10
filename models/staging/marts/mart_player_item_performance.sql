WITH stats AS (

    SELECT * FROM {{ ref('stg_stats1') }}

    UNION ALL

    SELECT * FROM {{ ref('stg_stats2') }}

),

participants AS (

    SELECT * FROM {{ ref('stg_participants') }}

),

champs AS (

    SELECT * FROM {{ ref('stg_champs') }}

)

SELECT

    s.participant_id,
    p.match_id,

    p.champion_id,
    c.champion_name,

    p.role,
    p.position,

    s.win,

    s.item1,
    s.item2,
    s.item3,
    s.item4,
    s.item5,
    s.item6,

    s.kills,
    s.deaths,
    s.assists,

    s.totdmgtochamp,
    s.dmgselfmit,

    s.goldearned,
    s.goldspent,

    s.visionscore,

    SAFE_DIVIDE(
        s.kills + s.assists,
        NULLIF(s.deaths,0)
    ) AS kda,

    SAFE_DIVIDE(
        s.totdmgtochamp,
        NULLIF(s.goldspent,0)
    ) AS damage_per_gold,

    SAFE_DIVIDE(
        s.dmgselfmit,
        NULLIF(s.goldspent,0)
    ) AS tankiness_per_gold

FROM stats s

LEFT JOIN participants p
    ON s.participant_id = p.participant_id

LEFT JOIN champs c
    ON p.champion_id = c.champion_id