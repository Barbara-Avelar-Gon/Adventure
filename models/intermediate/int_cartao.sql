with
    cartao as (
        select *
        from {{ ref('stg_adventure__cartao') }}
    )

    , cartao as (
        select
        cartao.pk_cartao
        , cartao.tipo_cartao
       
        from cartao
        
    )

select *
from cartao