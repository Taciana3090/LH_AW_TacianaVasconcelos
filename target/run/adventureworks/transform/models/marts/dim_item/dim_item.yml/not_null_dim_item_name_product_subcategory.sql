select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name_product_subcategory
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_item
where name_product_subcategory is null



      
    ) dbt_internal_test