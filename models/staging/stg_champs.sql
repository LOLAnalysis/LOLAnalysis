SELECT
    id AS champion_id,
    name AS champion_name
FROM {{ source('lol_raw', 'champs') }}