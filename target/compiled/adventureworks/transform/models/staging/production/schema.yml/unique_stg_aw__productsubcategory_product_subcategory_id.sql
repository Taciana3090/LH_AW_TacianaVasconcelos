
    
    

select
    product_subcategory_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productsubcategory
where product_subcategory_id is not null
group by product_subcategory_id
having count(*) > 1


