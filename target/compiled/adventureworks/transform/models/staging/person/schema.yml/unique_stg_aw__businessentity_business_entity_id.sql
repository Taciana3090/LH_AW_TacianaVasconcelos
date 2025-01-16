
    
    

select
    business_entity_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__businessentity
where business_entity_id is not null
group by business_entity_id
having count(*) > 1


