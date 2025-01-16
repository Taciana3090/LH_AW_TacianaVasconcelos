with 
    dim_salesorderheaderdetail as (
        select
            md5(cast(coalesce(cast(int_salesorderdetail.sales_order_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as salesorder_sk    
            , md5(cast(coalesce(cast(int_salesorderdetail.sales_order_detail_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as salesorderdetail_sk    
            , sales_order_id 
            , sales_order_detail_id 
        from SANDBOX.DEV_TACIANA_VASCONCELOS.int_salesorderdetail
    )

select *
from dim_salesorderheaderdetail