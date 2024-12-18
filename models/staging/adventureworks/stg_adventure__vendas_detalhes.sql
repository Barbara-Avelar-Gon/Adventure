with
    renomeado as (
        select
            cast(SALESORDERID as int) as pk_venda
            , cast (SALESORDERDETAILID as int) as pk_venda_detalhe
            , cast(PRODUCTID as int) as fk_produto
            , cast (SPECIALOFFERID as NUMBER(38,0)) as cod_promo_venda
            , cast (ORDERQTY as NUMBER(38,0)) as qtd_venda 
            , cast (UNITPRICE as NUMBER(38,6)) as valor_unitario_venda
            , cast (UNITPRICEDISCOUNT as NUMBER(38,6)) as valor_desconto_unit_venda


        from {{ source('adventureworks', 'SalesOrderDetail') }}
    )


select *
from renomeado