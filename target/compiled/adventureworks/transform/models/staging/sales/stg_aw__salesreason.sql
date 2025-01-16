with 
    salesreason as (
        select
            salesreasonid as sales_reason_id
            , name as reason_name
            , reasontype as reason_type
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.salesreason
    )

select *
from salesreason