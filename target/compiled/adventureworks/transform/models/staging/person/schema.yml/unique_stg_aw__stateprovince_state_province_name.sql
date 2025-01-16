
    
    

select
    state_province_name as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__stateprovince
where state_province_name is not null
group by state_province_name
having count(*) > 1


