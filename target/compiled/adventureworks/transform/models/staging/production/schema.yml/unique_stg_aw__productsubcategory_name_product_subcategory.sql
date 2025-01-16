
    
    

select
    name_product_subcategory as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productsubcategory
where name_product_subcategory is not null
group by name_product_subcategory
having count(*) > 1


