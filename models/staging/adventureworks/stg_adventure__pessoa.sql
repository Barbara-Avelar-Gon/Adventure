with
    renomeado as (
        select
            cast(BusinessEntityID as int) as pk_entidade
            , cast (PersonType as varchar) as tipo_pessoa
            , cast (Title as varchar) as titulo_pessoa
            , FirstName  || ' ' || LastName as nome_pessoa

        from {{ source('adventureworks', 'Person') }}
    )
    
select *
from renomeado