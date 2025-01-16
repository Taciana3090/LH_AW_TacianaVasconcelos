with 
    countryregion as (
        select distinct
            countryregioncode as countryregion_code
            , name as country_name
            , cast(modifieddate as datetime) as modified_date 
            /* meltano extraction */
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from {{source('db_aw_person','countryregion')}}
    )

select * 
from countryregion
