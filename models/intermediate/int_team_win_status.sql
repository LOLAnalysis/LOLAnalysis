with player_base as (
    select 
        p.match_id,
        -- Player slot 1-5 ise Mavi Takım (100), 6-10 ise Kırmızı Takım (200)
        case when p.player_slot <= 5 then 100 else 200 end as team_id,
        s.is_winner,
        s.gold_earned
    from {{ ref('stg_participants') }} p
    join {{ ref('stg_player_stats') }} s 
        on p.participant_id = s.participant_id
),

team_aggregated as (
    select
        match_id,
        team_id,
        max(is_winner) as is_winner, -- Takımdan biri kazandıysa o takım kazanmıştır (1 veya 0)
        sum(gold_earned) as total_team_gold
    from player_base
    group by 1, 2
)

select * from team_aggregated