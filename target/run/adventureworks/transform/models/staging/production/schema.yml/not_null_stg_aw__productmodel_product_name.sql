select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_name
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productmodel
where product_name is null



      
    ) dbt_internal_test