with
    renomeado as (
        select
            cast(PRODUCTID as int) as pk_produto
            , cast(NAME as string) as nm_produto 
            , cast(COLOR as string) as cor_produto
            , cast(PRODUCTSUBCATEGORYID as int) as fk_produto_subcat
            , cast(PRODUCTMODELID as int) as fk_produto_modelo

        from {{ source('adventureworks', 'PRODUCT') }}
    )

select *
from renomeado