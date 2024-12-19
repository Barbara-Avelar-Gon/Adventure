with
    cidade as (
        select *
        from {{ ref('stg_adventure__endereco_cidade') }}
    )

    , endereco_entidade as (
        select *
        from {{ ref('stg_adventure__endereco_entidade') }}
    )

    , estado as (
        select *
        from {{ ref('stg_adventure__endereco_estado') }}
    )

   , pais as (
        select *
        from {{ ref('stg_adventure__endereco_pais') }}
    )

   , tipo_endereco as (
        select *
        from {{ ref('stg_adventure__endereco_tipo') }}
    )

    
    , endereco_enriq as (
        select
        cidade.PK_ENDERECO
        , cidade.FK_ESTADO
        , endereco_entidade.PK_ENTIDADE
        , endereco_entidade.FK_ENDERECO
        , endereco_entidade.PK_TIPO_ENDERECO
        , estado.PK_ESTADO
        , estado.FK_PAIS
        , pais.PK_PAIS
        , tipo_endereco.PK_TIPO_ENDERECO
        , cidade.ENDERECO_1
        , cidade.ENDERECO_2
        , cidade.CIDADE
        , estado.NM_ESTADO
        , pais.NM_PAIS
        , tipo_endereco.TIPO_ENDERECO

        from endereco_entidade
        left join cidade on cidade.PK_ENDERECO = endereco_entidade.FK_ENDERECO
        left join estado on estado.PK_ESTADO = cidade.FK_ESTADO
        left join pais on pais.PK_PAIS = estado.FK_PAIS
        left join tipo_endereco on endereco_entidade.PK_TIPO_ENDERECO = tipo_endereco.PK_TIPO_ENDERECO
    )

select *
from endereco_enriq