with
    vendas as (
        select *
        from {{ ref('stg_adventure__vendas') }}
    )

    , vendas_detalhes as (
        select *
        from {{ ref('stg_adventure__vendas_detalhes') }}
    )

    
    , joined as (
        select
        vendas_detalhes.PK_VENDA_DETALHE
        , vendas.PK_VENDA
        , vendas_detalhes.FK_PRODUTO
        , vendas.FK_CUSTOMER
        , vendas.FK_CARTAO
        , vendas.FK_CONVERSAO
        , vendas.DT_VENDA
        , vendas.DT_ENTREGA_PREVISTA
        , vendas.DT_ENVIO
        , vendas.STATUS_VENDA
        , vendas_detalhes.COD_PROMO_VENDA
        , vendas.SUBTOTAL_VENDA
        , vendas.TAXA_VENDA
        , vendas.FRETE_VENDA
        , vendas.VALOR_TOTAL_VENDA
        , vendas_detalhes.QTD_VENDA
        , vendas_detalhes.VALOR_UNITARIO_VENDA
        , vendas_detalhes.VALOR_DESCONTO_UNIT_VENDA

        from vendas_detalhes
        left join vendas on vendas_detalhes.fk_venda = vendas.pk_venda
       
    )
, metricas as (
    select
        *
        ,
    from joined
)
