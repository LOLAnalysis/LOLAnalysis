SELECT
    id AS participant_id,
    win,
    item1,
    item2,
    item3,
    item4,
    item5,
    item6,
    trinket,
    kills,
    deaths,
    assists,
    totdmgtochamp,
    dmgselfmit,
    goldearned,
    goldspent,
    visionscore
FROM {{ source('lol_raw', 'stats1') }}