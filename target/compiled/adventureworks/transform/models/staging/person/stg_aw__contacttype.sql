with
    contacttype as (
        select
            contacttypeid as contact_type_id
            , name as contact_type_name
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.person.contacttype
    )

select *
from contacttype