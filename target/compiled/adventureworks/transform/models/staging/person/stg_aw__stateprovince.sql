with 
    stateprovince as (
        select
            cast(stateprovinceid as int) as state_province_id
            , territoryid as sales_territory_id
            , stateprovincecode as state_province_code
            , countryregioncode as countryregion_code
            , case
                when isonlystateprovinceflag = 't' then true
                else false
            end as is_only_state_province_flag
            , name as state_province_name
            , rowguid
            , date(modifieddate) as modified_date
        from RAW_AW.person.stateprovince
    )

select *
from stateprovince