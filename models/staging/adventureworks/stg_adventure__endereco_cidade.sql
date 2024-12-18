with
    renomeado as (
        select
            cast(AddressID as int) as pk_endereco
            , cast (AddressLine1 as varchar) as ENDERECO_1
            , cast (AddressLine2 as varchar) as ENDERECO_2
            , cast(City as varchar) as cidade 
            , cast(StateProvinceID as int) as fk_estado

        from {{ source('adventureworks', 'Address') }}
    )

select *
from renomeado