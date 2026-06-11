with filtered_matches as (
    select 
        match_id
    from {{ ref('stg_matches') }}
    -- 10 dakikadan (600 saniye) kısa süren erken surrender/remake maçlarını eliyoruz
    where match_duration_seconds >= 600
),

player_totals as (
    select
        p.match_id,
        case when p.player_slot < 5 then 100 else 200 end as team_id,
        max(ps.is_winner) as is_winner,
        sum(ps.kills) as team_kills,
        sum(ps.deaths) as team_deaths
    from {{ ref('stg_player_stats') }} ps
    join {{ ref('stg_participants') }} p on ps.participant_id = p.participant_id
    -- Sadece 10 dakikadan uzun süren maçların oyuncu istatistiklerini alıyoruz
    where p.match_id in (select match_id from filtered_matches)
    group by 1, 2
),

grouped_matrix as (
    select
        team_kills,
        team_deaths,
        concat(cast(team_kills as string), '-', cast(team_deaths as string)) as strategy_bucket,
        count(*) as total_games,
        sum(is_winner) as total_wins
    from player_totals
    where team_kills between 5 and 50 and team_deaths between 5 and 50
    group by 1, 2, 3
)

select
    strategy_bucket,
    team_kills,
    team_deaths,
    total_games,
    round(total_wins / total_games, 4) as win_probability
from grouped_matrix
where total_games >= 10