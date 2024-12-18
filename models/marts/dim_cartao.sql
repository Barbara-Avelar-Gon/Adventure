with
    int_cartao as (
        select *
        from {{ ref('int_cartao') }}
    )

select *
from int_cartao