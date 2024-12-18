with
    renomeado as (
        select
            cast(CountryRegionCode as varchar) as pk_pais
            , cast(Name as varchar) as nm_pais 

        from {{ source('adventureworks', 'CountryRegion') }}
    )

select *
from renomeado