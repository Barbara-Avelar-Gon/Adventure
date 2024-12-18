with
    produtos as (
        select *
        from {{ ref('stg_adventure__produtos') }}
    )

    , produtos_categ as (
        select *
        from {{ ref('stg_adventure__produtos_categ') }}
    )

    , produtos_subcat as (
        select *
        from {{ ref('stg_adventure__produtos_subcat') }}
    )

   , modelo as (
        select *
        from {{ ref('stg_adventure__produtos_modelo') }}
    )

    , produtos_enriq as (
        select
        produtos.PK_PRODUTO
        , produtos.FK_PRODUTO_SUBCAT
        , produtos.FK_PRODUTO_MODELO
        , produtos.NM_PRODUTO
        , produtos.COR_PRODUTO
        , produtos_categ.NM_PRODUTO_CAT
        , produtos_subcat.NM_PRODUTO_SUBCAT
        , modelo.NM_PRODUTO_MOD

        from produtos
        left join produtos_subcat on produtos_subcat.fk_produto_subcat = produtos.fk_produto_subcat
        left join modelo on modelo.fk_produto_modelo = produtos.fk_produto_modelo
        left join produtos_categ on produtos_categ.fk_produto_cat = produtos_subcat.fk_produto_cat
    )

select *
from produtos_enriq