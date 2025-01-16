with 
    addresstype as (
        select
            addresstypeid as address_type_id
            , name as address_type_name
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.person.addresstype
    )

select *
from addresstype