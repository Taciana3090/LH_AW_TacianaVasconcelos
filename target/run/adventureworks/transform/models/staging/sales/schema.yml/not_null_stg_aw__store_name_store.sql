select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name_store
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__store
where name_store is null



      
    ) dbt_internal_test