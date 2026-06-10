SELECT
    item_id,

    COUNT(*) AS pick_count,

    AVG(totdmgtochamp) AS avg_damage,

    AVG(goldearned) AS avg_gold,

    AVG(totdmgtochamp) /
    NULLIF(AVG(goldearned),0)
        AS damage_per_gold,

    AVG(dmgselfmit) /
    NULLIF(AVG(goldearned),0)
        AS tankiness_per_gold,

    AVG(CAST(win AS FLOAT64))
        AS win_rate

FROM {{ ref('mart_item_unpivoted') }}

GROUP BY item_id

HAVING COUNT(*) > 100