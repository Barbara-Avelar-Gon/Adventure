with
    renomeado as (
        select
            cast(SalesOrderID as int) as pk_razao_venda
            , cast(SalesReasonID as int) as fk_razao 

        from {{ source('adventureworks', 'SalesOrderHeaderSalesReason') }}
    )

select *
from renomeado