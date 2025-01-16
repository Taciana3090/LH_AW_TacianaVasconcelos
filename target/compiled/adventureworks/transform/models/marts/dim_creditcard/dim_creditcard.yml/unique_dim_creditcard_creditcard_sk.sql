
    
    

select
    creditcard_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_creditcard
where creditcard_sk is not null
group by creditcard_sk
having count(*) > 1


