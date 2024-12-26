with
    razao_venda as (
        select *
        from {{ ref('stg_adventure__razao_venda') }}
    )

    , razao_dsc as (
        select *
        from {{ ref('stg_adventure__razao_dsc') }}
    )

    
    , razao_enriq as (
        select
        razao_venda.PK_RAZAO_VENDA
        --, razao_venda.FK_RAZAO
        , listagg(razao_dsc.NM_RAZAO, ', ') within group (order by razao_dsc.NM_RAZAO asc) RAZAO_AGREG
        --, razao_dsc.TIPO_RAZAO

        from razao_venda
        left join razao_dsc on razao_dsc.FK_RAZAO = razao_venda.FK_RAZAO

        group by razao_venda.PK_RAZAO_VENDA
       
    )

select *
from razao_enriq