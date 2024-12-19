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
        , vendas.fk_territorio
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
        , QTD_VENDA * VALOR_UNITARIO_VENDA as VALOR_BRUTO
        , (QTD_VENDA * (VALOR_UNITARIO_VENDA * (1- VALOR_DESCONTO_UNIT_VENDA))) as VALOR_LIQ
        , FRETE_VENDA/ (COUNT(*) OVER(PARTITION BY PK_VENDA)) AS FRETE_RATEADO
        , CASE
            WHEN VALOR_DESCONTO_UNIT_VENDA>0 THEN TRUE
            ELSE FALSE
        END AS DESCONTO
    from joined
)

    , FINAL_SELECT AS (
        SELECT 
            PK_VENDA_DETALHE
            , PK_VENDA
            , FK_PRODUTO
            , FK_CUSTOMER
            , FK_CARTAO
            , FK_CONVERSAO
            , FK_TERRITORIO 
            , DT_VENDA
            , DT_ENTREGA_PREVISTA
            , DT_ENVIO
            , SUBTOTAL_VENDA
            , TAXA_VENDA
            , QTD_VENDA
            , VALOR_TOTAL_VENDA
            , VALOR_UNITARIO_VENDA
            , VALOR_DESCONTO_UNIT_VENDA
            , VALOR_BRUTO
            , VALOR_LIQ
            , CAST (FRETE_RATEADO AS NUMERIC (38,4)) AS FRETE_RATEADO
            , DESCONTO
            , STATUS_VENDA
            , COD_PROMO_VENDA

        FROM metricas
    )

SELECT *
FROM FINAL_SELECT