SELECT
    item_id,
    COUNT(*) AS pick_count,
    AVG(CAST(win AS FLOAT64)) AS win_rate,
    AVG(damage_per_gold) AS damage_per_gold,
    AVG(tankiness_per_gold) AS tankiness_per_gold

FROM {{ ref('mart_item_unpivoted') }}

GROUP BY item_id

HAVING COUNT(*) > 500

ORDER BY win_rate DESC