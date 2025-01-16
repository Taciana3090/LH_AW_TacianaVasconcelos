select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select cost_last_year
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesterritory
where cost_last_year is null



      
    ) dbt_internal_test