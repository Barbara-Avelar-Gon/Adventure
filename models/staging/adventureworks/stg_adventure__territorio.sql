with
    renomeado as (
        select
            cast(TerritoryID as int) as pk_territorio
            , cast (CountryRegionCode as varchar) as fk_pais
            , cast (Name as varchar) as nm_territorio

        from {{ source('adventureworks', 'SalesTerritory') }}
    )

select *
from renomeado