with   
    fonte_endereco as (
        select *
        from {{ source('adventureworks', 'ADDRESS') }}
    )

    , renomeacao as (
        select ADDRESSID as PK_ENDERECO,
	            ADDRESSLINE1 AS ENDERECO_1,
	            ADDRESSLINE2 AS ENDERECO_2,
                CITY AS ENDERECO_CIDADE,
                STATEPROVINCEID AS ENDERECO_PROV_ID,
                POSTALCODE AS ENDERECO_CEP,
                --SPATIALLOCATION,
                --ROWGUID,
                cast (MODIFIEDDATE as date) as ENDERECO_MODIFIEDDATE
        from fonte_endereco
    )

select *
from renomeacao