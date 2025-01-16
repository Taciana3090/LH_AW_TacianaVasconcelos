
    
    

select
    country_name as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion
where country_name is not null
group by country_name
having count(*) > 1


