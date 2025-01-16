with
    emailaddress as (
        select
            emailaddressid as email_address_id
            , businessentityid as business_entity_id
            , translate(
                lower(cast( emailaddress as string))
                , 'áéíóúãõâêîôûàèìòùäëïöüñç'
                , 'aeiouaoaeiouaeiounc'
            ) as email_address
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.person.emailaddress
    )

select *
from emailaddress