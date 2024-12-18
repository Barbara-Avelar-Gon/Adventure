with
    renomeado as (
        select
            cast(SALESORDERID as int) as pk_venda
            , cast(ORDERDATE as date) as dt_venda 
            , cast(DUEDATE as date) as dt_entrega_prevista
            , cast(SHIPDATE as date) as dt_envio
            , cast(STATUS as int) as status_venda
            , cast (CUSTOMERID as int) as fk_customer
            , cast (CREDITCARDID as int) as fk_cartao
            , cast (CURRENCYRATEID as int) as fk_conversao
            , cast (SUBTOTAL as NUMBER(38,6)) as subtotal_venda
            , cast (TAXAMT as NUMBER(38,6)) as taxa_venda
            , cast (FREIGHT as NUMBER(38,6)) as frete_venda
            , cast (TOTALDUE as NUMBER(38,6)) as valor_total_venda


        from {{ source('adventureworks', 'SalesOrderHeader') }}
    )


select *
from renomeado