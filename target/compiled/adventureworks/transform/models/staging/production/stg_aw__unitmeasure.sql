with
    unitmeasure as (
        select
            unitmeasurecode as unit_measure_code
            , name unit_measure_name
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.production.unitmeasure
    )

select *
from unitmeasure