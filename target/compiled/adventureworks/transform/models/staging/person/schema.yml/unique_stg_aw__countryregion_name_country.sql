
    
    

select
    name_country as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion
where name_country is not null
group by name_country
having count(*) > 1


