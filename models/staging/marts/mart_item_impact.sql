WITH champion_avg AS (

SELECT
    champion_name,
    AVG(CAST(win AS FLOAT64)) AS champion_winrate
FROM {{ ref('mart_item_unpivoted') }}
GROUP BY champion_name

),

champion_item AS (

SELECT
    champion_name,
    item_id,
    COUNT(*) AS pick_count,
    AVG(CAST(win AS FLOAT64)) AS item_winrate

FROM {{ ref('mart_item_unpivoted') }}

GROUP BY
    champion_name,
    item_id

HAVING COUNT(*) > 20

)

SELECT
    ci.*,
    ca.champion_winrate,
    ci.item_winrate - ca.champion_winrate
        AS winrate_boost

FROM champion_item ci

JOIN champion_avg ca
ON ci.champion_name = ca.champion_name