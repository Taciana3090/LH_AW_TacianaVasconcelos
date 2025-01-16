with 
    person as (
        select
            /* primary key and foreign key*/
            businessentityid as business_entity_id
            , persontype as person_type
            , case
                when namestyle = 't' then initcap(lower(lastname))
                else initcap(lower(firstname))
            end as first_name
            ,  initcap(lower(middlename)) as middle_name
            , case
                when namestyle = 't' then initcap(lower(firstname))
                else initcap(lower(lastname))
            end as last_name
            , case
                when title like '%Sra%' then 'Mrs.'
                when title like '%Sr%' then 'Mr.'
                else title
            end as name_title
            , suffix as name_suffix
            , case
                when additionalcontactinfo = '[NULL]' then null
                else additionalcontactinfo
            end as additional_contact_info
            , case
                when demographics = '[NULL]' then null
                else demographics
            end as demographics
            , emailpromotion as email_promotion
            ,  date(modifieddate) as modified_date

            /* meltano extraction */
            , _sdc_extracted_at 
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.person.person
    )

select *
from person