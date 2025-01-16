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
        from {{source('db_aw_sales','salesorderheadersalesreason')}}
    )

select *
from salesorderheadersalesreason
