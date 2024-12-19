with
    renomeado as (
        select
            cast(CustomerID as int) as pk_cliente
            , cast (PersonID as int) as fk_entidade

        from {{ source('adventureworks', 'Customer') }}
    )
    
select *
from renomeado