with 
    address as (
        select distinct
            addressid as address_id
            , stateprovinceid as stateprovince_id
            , addressline1 as address_line
            , postalcode as postal_code
            , city
            , rowguid
            , CAST(modifieddate as DATETIME) as modified_date
        from RAW_AW.person.address
    )

select * 
from address