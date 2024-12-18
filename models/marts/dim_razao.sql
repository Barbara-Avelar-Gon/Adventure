with
    int_razao as (
        select *
        from {{ ref('int_razao_enriq') }}
    )

select *
from int_razao