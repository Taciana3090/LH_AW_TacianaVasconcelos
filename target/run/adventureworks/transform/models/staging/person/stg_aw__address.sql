
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__address
  
   as (
    with 
    address as (
        select distinct
            addressid as address_id
            , stateprovinceid as state_province_id
            , lower(trim(regexp_replace(addressline1, '\\b\\d+\\b|\\bno\\.\\?\\b|\\bn\\.\\?\\b|,', ''))) as address_line
            , postalcode as postal_code
            , city
            , rowguid
            , cast(modifieddate as datetime) as modified_date   
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.person.address
    )

select *
from address
  );

