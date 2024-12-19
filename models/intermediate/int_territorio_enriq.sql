with
    territorio as (
        select *
        from {{ ref('stg_adventure__territorio') }}
    )

   , pais as (
        select *
        from {{ ref('stg_adventure__endereco_pais') }}
    )
    
    , territorio_enriq as (
        select
        territorio.pk_territorio
        , territorio.nm_territorio
        , pais.NM_PAIS

        from territorio
        left join pais on pais.PK_PAIS = territorio.FK_PAIS

    )

select *
from territorio_enriq