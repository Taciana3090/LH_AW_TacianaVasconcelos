
    
    

select
    territory_name as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesterritory
where territory_name is not null
group by territory_name
having count(*) > 1


