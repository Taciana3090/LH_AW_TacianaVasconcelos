select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select safety_stock_level
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
where safety_stock_level is null



      
    ) dbt_internal_test