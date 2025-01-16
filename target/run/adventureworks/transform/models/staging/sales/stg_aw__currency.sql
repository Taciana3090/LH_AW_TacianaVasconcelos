
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__currency
  
   as (
    with 
    currency as (
        select
            currencycode as currency_code
            , name as currency_name
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.currency
    )

select *
from currency
  );

