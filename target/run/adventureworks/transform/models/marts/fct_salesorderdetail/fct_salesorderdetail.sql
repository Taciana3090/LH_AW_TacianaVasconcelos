
  
    

        create or replace transient table SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderdetail
         as
        (with 
    dim_item as (
        select
            product_sk
            , product_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_item
    )

    , dim_salesorderheaderdetail as (
        select *
        from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
    )

    , int_salesorderdetail as (
        select  
            sales_order_detail_id
            , order_quantity
            , product_id
            , unit_price
            , unit_price_discount
            , grossrevenue
            , discount
        from SANDBOX.DEV_TACIANA_VASCONCELOS.int_salesorderdetail
    )

    , fct_salesorderdetail as (
        select
            md5(cast(coalesce(cast(dim_salesorderheaderdetail.sales_order_detail_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(int_salesorderdetail.sales_order_detail_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as salesorderdetail_sk        
            , dim_item.product_id as product_fk
            , dim_salesorderheaderdetail.sales_order_detail_id as salesorderdetail_fk
            , int_salesorderdetail.product_id
            , int_salesorderdetail.sales_order_detail_id
            , int_salesorderdetail.order_quantity
            , int_salesorderdetail.unit_price
            , int_salesorderdetail.unit_price_discount
            , int_salesorderdetail.grossrevenue
            , int_salesorderdetail.discount
        from int_salesorderdetail
        left join dim_item on int_salesorderdetail.product_id = dim_item.product_id
        left join dim_salesorderheaderdetail on int_salesorderdetail.sales_order_detail_id = dim_salesorderheaderdetail.sales_order_detail_id
    )

select *
from fct_salesorderdetail
        );
      
  