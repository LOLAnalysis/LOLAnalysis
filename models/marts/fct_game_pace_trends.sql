with pace_calc as (
    select
        season_id,
        count(match_id) as total_matches,
        -- Saniyeyi dakikaya çevirip ortalamasını alıyoruz
        round(avg(match_duration_seconds) / 60, 2) as avg_duration_minutes,
        -- Oyunun ne kadar "kanlı/agresif" geçtiğini göstermek için maç başına ortalama kill sayısını da ekleyelim (Opsiyonel ama hikayeyi çok güçlendirir)
        round(sum(match_duration_seconds) / 60, 0) as total_playtime_minutes
    from {{ ref('stg_matches') }}
    group by 1
)

select
    season_id,
    total_matches,
    avg_duration_minutes
from pace_calc
order by season_id asc