
  
    

        create or replace transient table SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
         as
        (with 
    dim_client as (
        select
         customer_sk
        ,customer_id
    from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_client
)

    , dim_location as (
        select
            shiptoaddress_sk
            ,ship_to_address_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_location
    )

    , dim_creditcard as (
        select
            creditcard_sk
            ,credit_card_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_creditcard
    )

    , dim_salesorderheaderdetail as (
        select 
            sales_order_id
            ,count(distinct sales_order_detail_id) as items
        from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
        group by sales_order_id
    )

    , stg_salesorderheader as (
        select 
            sales_order_id
            ,order_date 
            ,ship_date 
            ,case
                when status = 1 then 'In_process'
                when status = 2 then 'Approved'
                when status = 3 then 'Backordered' 
                when status = 4 then 'Rejected' 
                when status = 5 then 'Shipped'
                when status = 6 then 'Cancelled' 
                else 'No status'
            end as status
            ,customer_id 
            ,sales_person_id 
            ,bill_to_address_id 
            ,ship_to_address_id
            ,ship_method_id 
            ,credit_card_id
            ,sub_total 
            ,taxa_amount
            ,freight 
            ,total_due 
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderheader
    )

    , fct_salesorderheader as (
        select 
            md5(cast(coalesce(cast(stg_salesorderheader.sales_order_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as salesorderheader_sk
            ,dim_client.customer_sk as customer_fk
            ,dim_location.shiptoaddress_sk as shiptoaddress_fk
            ,dim_creditcard.creditcard_sk as creditcard_fk
            ,dim_salesorderheaderdetail.sales_order_id as salesorder_fk
            ,stg_salesorderheader.sales_order_id 
            ,stg_salesorderheader.order_date 
            ,stg_salesorderheader.ship_date 
            ,stg_salesorderheader.status
            ,stg_salesorderheader.customer_id 
            ,stg_salesorderheader.sales_person_id 
            ,stg_salesorderheader.bill_to_address_id 
            ,stg_salesorderheader.ship_to_address_id
            ,stg_salesorderheader.ship_method_id 
            ,stg_salesorderheader.credit_card_id
            ,stg_salesorderheader.sub_total 
            ,stg_salesorderheader.taxa_amount
            ,stg_salesorderheader.freight 
            ,stg_salesorderheader.total_due 
        from stg_salesorderheader
        left join dim_location on stg_salesorderheader.ship_to_address_id = dim_location.ship_to_address_id
        left join dim_client on stg_salesorderheader.customer_id = dim_client.customer_id
        left join dim_creditcard on stg_salesorderheader.credit_card_id = dim_creditcard.credit_card_id
        left join dim_salesorderheaderdetail on stg_salesorderheader.sales_order_id = dim_salesorderheaderdetail.sales_order_id
    )

select *
from fct_salesorderheader
        );
      
  