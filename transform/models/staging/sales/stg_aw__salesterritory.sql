with 
    salesterritory as (
        select
            territoryid as territory_id
            , name as territory_name
            , countryregioncode as countryregion_code
            , 'group' as territory_group
            , salesytd as sales_year_to_end
            , saleslastyear as sales_last_year
            , costytd as cost_year_to_end
            , costlastyear as cost_last_year
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from {{source('db_aw_sales', 'salesterritory')}}
    )

select *
from salesterritory
