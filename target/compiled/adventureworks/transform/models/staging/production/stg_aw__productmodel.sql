with
    productmodel as (
        select
            productmodelid as product_model_id
            , name as product_name
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.production.productmodel
    )

select *
from productmodel