
    
    

select
    name_method as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__shipmethod
where name_method is not null
group by name_method
having count(*) > 1


