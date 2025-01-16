with 
    dim_salesorderheaderdetail as (
        select
            {{ dbt_utils.generate_surrogate_key (
                ['int_salesorderdetail.sales_order_id']
            ) }} as salesorder_sk    
            , {{ dbt_utils.generate_surrogate_key (
                ['int_salesorderdetail.sales_order_detail_id']
            ) }} as salesorderdetail_sk    
            , sales_order_id 
            , sales_order_detail_id 
        from {{ ref('int_salesorderdetail') }}
    )

select *
from dim_salesorderheaderdetail