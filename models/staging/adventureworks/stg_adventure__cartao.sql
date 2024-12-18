with
    renomeado as (
        select
            cast(CreditCardID as int) as pk_cartao
            , cast(CardType as string) as tipo_cartao 

        from {{ source('adventureworks', 'CreditCard') }}
    )

select *
from renomeado