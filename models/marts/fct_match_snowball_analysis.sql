with team_objectives as (
    select * from {{ ref('stg_team_stats') }}
),

team_wins as (
    select * from {{ ref('int_team_win_status') }}
),

match_details as (
    select * from {{ ref('stg_matches') }}
),

final_joined as (
    select
        obj.match_id,
        obj.team_id,
        m.game_version,
        m.match_duration_seconds,
        w.is_winner,
        w.total_team_gold,
        
        -- Erken Oyun Objektifleri
        obj.has_first_blood,
        obj.has_first_turret,
        obj.has_first_inhibitor,
        obj.has_first_baron,
        obj.has_first_dragon,
        obj.has_first_herald,
        
        -- Toplam Alınan Objektif Sayıları
        obj.tower_kills,
        obj.inhibitor_kills,
        obj.baron_kills,
        obj.dragon_kills,
        obj.herald_kills,
        
        -- Gelişmiş Metrikler (Feature Engineering)
        round(w.total_team_gold / nullif(m.match_duration_seconds / 60, 0), 2) as gold_per_minute,
        (obj.dragon_kills + obj.baron_kills + obj.herald_kills) as total_epic_monsters_slain
        
    from team_objectives obj
    join team_wins w 
        on obj.match_id = w.match_id and obj.team_id = w.team_id
    join match_details m 
        on obj.match_id = m.match_id
)

select * from final_joined