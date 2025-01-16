select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name_method
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__shipmethod
where name_method is null



      
    ) dbt_internal_test