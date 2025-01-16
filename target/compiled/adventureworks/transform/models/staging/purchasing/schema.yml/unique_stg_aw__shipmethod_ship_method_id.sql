
    
    

select
    ship_method_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__shipmethod
where ship_method_id is not null
group by ship_method_id
having count(*) > 1


