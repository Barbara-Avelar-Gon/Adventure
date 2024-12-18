with
    renomeado as (
        select
            cast(AddressTypeID as int) as pk_tipo_endereco
            , cast (Name as varchar) as tipo_endereco

        from {{ source('adventureworks', 'AddressType') }}
    )

select *
from renomeado