select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select commission_pct
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesperson
where commission_pct is null



      
    ) dbt_internal_test