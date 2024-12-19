with
    cliente as (
        select *
        from {{ ref('stg_adventure__cliente') }}
    )

    , pessoa as (
        select *
        from {{ ref('stg_adventure__pessoa') }}
    )

       
    , cliente_enriq as (
        select
        cliente.PK_CLIENTE
        , cliente.FK_ENTIDADE
        , pessoa.TIPO_PESSOA
        , pessoa.TITULO_PESSOA
        , pessoa.NOME_PESSOA

        from cliente
        left join pessoa on cliente.FK_ENTIDADE = pessoa.PK_ENTIDADE
    )

select *
from cliente_enriq