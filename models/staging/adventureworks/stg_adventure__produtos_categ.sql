with
    renomeado as (
        select
            cast(PRODUCTCATEGORYID as int) as fk_produto_cat
            , cast(NAME as string) as nm_produto_cat 


        from {{ source('adventureworks', 'ProductCategory') }}
    )

select *
from renomeado