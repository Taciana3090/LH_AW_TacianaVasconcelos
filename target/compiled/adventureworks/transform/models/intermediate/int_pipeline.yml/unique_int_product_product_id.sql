
    
    

select
    product_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.int_product
where product_id is not null
group by product_id
having count(*) > 1


