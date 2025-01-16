
    
    

select
    email_address as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.int_customer
where email_address is not null
group by email_address
having count(*) > 1


