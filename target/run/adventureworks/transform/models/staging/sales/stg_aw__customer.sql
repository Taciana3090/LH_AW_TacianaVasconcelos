
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__customer
  
   as (
    with 
    customer as (
        select
            customerid as customer_id
            , personid as person_id
            , storeid as store_id
            , territoryid as territory_id
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.customer
    )

select *
from customer
  );

