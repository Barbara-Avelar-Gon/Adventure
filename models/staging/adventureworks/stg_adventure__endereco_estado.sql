with
    renomeado as (
        select
            cast(StateProvinceID as int) as pk_estado
            , cast(CountryRegionCode as varchar) as fk_pais 
            , cast(Name as varchar) as nm_estado

        from {{ source('adventureworks', 'StateProvince') }}
    )

select *
from renomeado