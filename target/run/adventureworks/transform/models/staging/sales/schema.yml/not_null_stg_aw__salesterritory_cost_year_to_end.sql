select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select cost_year_to_end
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesterritory
where cost_year_to_end is null



      
    ) dbt_internal_test