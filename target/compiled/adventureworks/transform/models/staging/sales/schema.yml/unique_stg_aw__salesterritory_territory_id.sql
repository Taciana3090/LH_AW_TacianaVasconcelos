
    
    

select
    territory_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesterritory
where territory_id is not null
group by territory_id
having count(*) > 1


