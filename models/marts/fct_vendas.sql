with
    int_vendas as (
        select *
        from {{ ref('int_vendas_metric') }}
    )

, dim_produto as (
        select *
        from {{ ref('dim_produto') }}
    )

    , dim_razao as (
        select *
        from {{ ref('dim_razao') }}
    )

    , dim_cartao as (
        select *
        from {{ ref('dim_cartao') }}
    )
-- cliente
    

select *
from int_vendas
