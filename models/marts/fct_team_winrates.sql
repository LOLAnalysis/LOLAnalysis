with match_sides as (
    select
        match_id,
        max(case when team_id = 100 then is_winner else 0 end) as blue_winner,
        max(case when team_id = 200 then is_winner else 0 end) as red_winner
    from {{ ref('fct_match_snowball_analysis') }}
    group by 1
)

select
    round(sum(blue_winner) / count(match_id), 4) as blue_winrate,
    round(sum(red_winner) / count(match_id), 4) as red_winrate
from match_sides