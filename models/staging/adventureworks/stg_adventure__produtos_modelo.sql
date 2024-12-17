with
    renomeado as (
        select
            cast(PRODUCTMODELID as int) as fk_produto_modelo
            , cast(NAME as string) as nm_produto_mod 


        from {{ source('adventureworks', 'ProductModel') }}
    )

select *
from renomeado