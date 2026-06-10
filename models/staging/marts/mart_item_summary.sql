SELECT

    item_id,

    COUNT(*) AS pick_count,

    AVG(win) AS win_rate,

    AVG(totdmgtochamp) AS avg_damage,

    AVG(dmgselfmit) AS avg_tankiness,

    AVG(goldearned) AS avg_gold,

    AVG(damage_per_gold) AS avg_damage_per_gold,

    AVG(tankiness_per_gold) AS avg_tankiness_per_gold,

    AVG(kda) AS avg_kda

FROM {{ ref('mart_item_unpivoted') }}

GROUP BY item_id