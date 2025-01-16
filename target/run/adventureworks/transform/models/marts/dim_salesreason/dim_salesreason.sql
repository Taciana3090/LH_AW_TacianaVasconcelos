
  
    

        create or replace transient table SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesreason
         as
        (with 
    stg_aw__salesorderheader as(
        select
            distinct(sales_order_id)
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderheader
    )

    , int_salesreason as (
        select 
            sales_reason_id
            , sales_order_id
            , reason_name
            , reason_type
        from SANDBOX.DEV_TACIANA_VASCONCELOS.int_salesreason 
    )

    , dim_salesreason as (
        select
            md5(cast(coalesce(cast(stg_aw__salesorderheader.sales_order_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(int_salesreason.sales_order_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as reason_sk       
            , int_salesreason.sales_order_id
            , listagg(int_salesreason.reason_name, ', ') as reason_name
        from stg_aw__salesorderheader
        left join int_salesreason on stg_aw__salesorderheader.sales_order_id = int_salesreason.sales_order_id
        group by int_salesreason.sales_order_id, stg_aw__salesorderheader.sales_order_id
    )

select *
from dim_salesreason
        );
      
  