with stats1_source as (
    select * from {{ source('bq_raw', 'stats1') }}
),

stats2_source as (
    select * from {{ source('bq_raw', 'stats2') }}
),

combined_stats as (
    select * from stats1_source
    union all
    select * from stats2_source
)

select
    id as participant_id,
    win as is_winner,
    goldearned as gold_earned,
    goldspent as gold_spent,
    kills,
    deaths,
    assists
from combined_stats