
    
    

select
    customer_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_client
where customer_sk is not null
group by customer_sk
having count(*) > 1


