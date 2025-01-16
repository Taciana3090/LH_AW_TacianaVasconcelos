
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salespersonquotahistory
  
   as (
    with
    salespersonquotahistory as (
        select
            businessentityid as business_entity_id
            , quotadate as quota_date
            , salesquota as sales_quota
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.salespersonquotahistory
    )

select *
from salespersonquotahistory
  );

