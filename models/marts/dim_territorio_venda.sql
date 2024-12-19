with
    int_territorio as (
        select *
        from {{ ref('int_territorio_enriq') }}
    )

select *
from int_territorio