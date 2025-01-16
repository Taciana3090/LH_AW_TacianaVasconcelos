
    
    

select
    reason_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesreason
where reason_sk is not null
group by reason_sk
having count(*) > 1


