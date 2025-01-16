select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_number
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
where product_number is null



      
    ) dbt_internal_test