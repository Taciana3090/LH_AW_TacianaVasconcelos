
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderheadersalesreason
  
   as (
    with
    salesorderheadersalesreason as (
        select
            salesreasonid as sales_reason_id
            , salesorderid as sales_order_id
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.salesorderheadersalesreason
    )

select *
from salesorderheadersalesreason
  );

