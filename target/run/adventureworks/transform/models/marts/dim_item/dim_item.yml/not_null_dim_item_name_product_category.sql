select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name_product_category
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_item
where name_product_category is null



      
    ) dbt_internal_test