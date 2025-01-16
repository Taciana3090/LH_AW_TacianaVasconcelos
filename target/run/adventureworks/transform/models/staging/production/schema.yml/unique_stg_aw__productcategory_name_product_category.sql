select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    name_product_category as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productcategory
where name_product_category is not null
group by name_product_category
having count(*) > 1



      
    ) dbt_internal_test