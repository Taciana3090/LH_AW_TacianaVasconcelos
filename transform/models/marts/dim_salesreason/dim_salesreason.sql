with 
    stg_aw__salesorderheader as(
        select
            distinct(sales_order_id)
        from {{ ref('stg_aw__salesorderheader')}}
    )

    , int_salesreason as (
        select 
            sales_reason_id
            , sales_order_id
            , reason_name
            , reason_type
        from {{ ref('int_salesreason') }} 
    )

    , dim_salesreason as (
        select
            {{ dbt_utils.generate_surrogate_key (
                ['stg_aw__salesorderheader.sales_order_id'
                , 'int_salesreason.sales_order_id']
            ) }} as reason_sk       
            , int_salesreason.sales_order_id
            , listagg(int_salesreason.reason_name, ', ') as reason_name
        from stg_aw__salesorderheader
        left join int_salesreason on stg_aw__salesorderheader.sales_order_id = int_salesreason.sales_order_id
        group by int_salesreason.sales_order_id, stg_aw__salesorderheader.sales_order_id
    )

select *
from dim_salesreason