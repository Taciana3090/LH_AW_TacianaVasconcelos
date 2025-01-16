
    
    

select
    state_province_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__stateprovince
where state_province_id is not null
group by state_province_id
having count(*) > 1


