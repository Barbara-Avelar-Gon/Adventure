with
    renomeado as (
        select
            cast(BusinessEntityID as int) as pk_entidade
            , case
              when PersonType = 'SC' then 'Contato Loja' 
                when PersonType = 'IN' then 'Cliente Varejo'
                when PersonType = 'SP' then 'Vendedor'
                when PersonType = 'EM' then 'Funcionario (nao vendas)'
                when PersonType = 'VC' then 'Contato Fornecedor'
                when PersonType = 'GC' then 'Contato Geral'
                else null
                end as tipo_pessoa
            , cast (Title as varchar) as titulo_pessoa
            , FirstName  || ' ' || LastName as nome_pessoa

        from {{ source('adventureworks', 'Person') }}
    )
    
select *
from renomeado