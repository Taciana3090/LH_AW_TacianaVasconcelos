select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ship_base
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__shipmethod
where ship_base is null



      
    ) dbt_internal_test