
    
    

select
    product_category_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productcategory
where product_category_id is not null
group by product_category_id
having count(*) > 1


