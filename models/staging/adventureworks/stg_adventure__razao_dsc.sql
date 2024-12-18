with
    renomeado as (
        select
            cast(SalesReasonID as int) as fk_razao
            , cast(Name as string) as nm_razao
            , cast (ReasonType as string) as tipo_razao

        from {{ source('adventureworks', 'SalesReason') }}
    )

select *
from renomeado