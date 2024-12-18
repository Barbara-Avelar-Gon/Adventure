/* Este teste garante que o valor bruto das vendas
de 2011 foi de $12.646.112,16 */

with

    vendas_em_2011 as (
        select sum(VALOR_BRUTO) as total_bruto
        from {{ ref('int_vendas_metric') }}
        where DT_VENDA between '2011-01-01' and '2011-12-31'
    ) -- $ 12.646.112,16

select total_bruto
from vendas_em_2011
where total_bruto not between 12646112.15 and 12646112.17