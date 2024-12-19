with
    int_cliente as (
        select *
        from {{ ref('int_cliente_enriq') }}
    )

select *
from int_cliente