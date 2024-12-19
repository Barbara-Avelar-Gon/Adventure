with
    int_enderecos as (
        select *
        from {{ ref('int_endereco_enriq') }}
    )

select *
from int_enderecos