with
    renomeado as (
        select
            cast(PRODUCTSUBCATEGORYID as int) as fk_produto_subcat
            , cast(PRODUCTCATEGORYID as int) as fk_produto_cat
            , cast(NAME as string) as nm_produto_subcat

        from {{ source('adventureworks', 'ProductSubcategory') }}
    )

select *
from renomeado