
    
    

select
    address_type_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__addresstype
where address_type_id is not null
group by address_type_id
having count(*) > 1


