
    
    

select
    product_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_item
where product_sk is not null
group by product_sk
having count(*) > 1


