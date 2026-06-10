SELECT
    champion_name,
    item_id,
    COUNT(*) AS pick_count,
    AVG(CAST(win AS FLOAT64)) AS win_rate

FROM {{ ref('mart_item_unpivoted') }}

GROUP BY
    champion_name,
    item_id

HAVING COUNT(*) > 20