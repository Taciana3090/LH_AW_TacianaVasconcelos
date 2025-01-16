
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesperson
  
   as (
    with 
    salesperson as (
        select
            businessentityid as business_entity_id
            , territoryid as territory_id
            , salesquota as sales_quota
            , bonus
            , commissionpct as commission_pct
            , salesytd as sales_year_to_date
            , saleslastyear as sales_last_year
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.salesperson
    )

select *
from salesperson
  );

