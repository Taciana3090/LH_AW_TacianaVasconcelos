
    
    

select
    salesorderdetail_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
where salesorderdetail_sk is not null
group by salesorderdetail_sk
having count(*) > 1


