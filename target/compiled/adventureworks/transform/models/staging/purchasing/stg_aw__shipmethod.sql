with
    shipmethod as (
        select
            shipmethodid as ship_method_id
            , name as name_method
            , shipbase as ship_base
            , shiprate as ship_rate
            , rowguid
            , date(modifieddate) as modified_date

            /* meltano extraction */
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.purchasing.shipmethod
    )

select *
from shipmethod