select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select last_name
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__person
where last_name is null



      
    ) dbt_internal_test