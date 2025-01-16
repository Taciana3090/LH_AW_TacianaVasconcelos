
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderdetail
  
   as (
    with 
    salesorderdetail as (
        select
            salesorderid as sales_order_id
            , salesorderdetailid as sales_order_detail_id
            , carriertrackingnumber as carrier_tracking_number
            , orderqty as order_quantity
            , productid as product_id
            , specialofferid as special_offer_id
            , unitprice * (1 - unitpricediscount) * orderqty as line_total
            , unitprice as unit_price
            , unitpricediscount as unit_price_discount
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.salesorderdetail
    )

select *
from salesorderdetail
  );

