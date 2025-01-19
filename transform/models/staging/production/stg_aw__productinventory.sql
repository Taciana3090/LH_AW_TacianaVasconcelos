with
    productinventory as (
        select
            productid as product_id
            , locationid as location_id
            , shelf
            , bin
            , quantity
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from {{source('db_aw_production','productinventory')}}
    )

select *
from productinventory
