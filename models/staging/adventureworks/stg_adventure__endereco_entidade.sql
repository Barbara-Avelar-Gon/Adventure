with
    renomeado as (
        select
            cast(BusinessEntityID as int) as pk_entidade
            , cast (AddressID as varchar) as fk_endereco
            , cast (AddressTypeID as varchar) as pk_tipo_endereco

        from {{ source('adventureworks', 'BusinessEntityAddress') }}
    )
    
select *
from renomeado