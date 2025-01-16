
    
    

select
    product_number as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
where product_number is not null
group by product_number
having count(*) > 1


