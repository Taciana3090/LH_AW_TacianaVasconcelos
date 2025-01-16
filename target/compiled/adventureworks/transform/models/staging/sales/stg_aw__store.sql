with
    store as (
        select
            businessentityid as business_entity_id
            , name as store_name
            , salespersonid as sales_person_id
            , demographics
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.store
    )

select *
from store