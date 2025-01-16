
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.int_customer
where customer_id is not null
group by customer_id
having count(*) > 1


