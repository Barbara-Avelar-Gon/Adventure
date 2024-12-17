with
    int_produtos as (
        select *
        from {{ ref('int_produtos_enriq') }}
    )

select *
from int_produtos