select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select discount_pct
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__specialoffer
where discount_pct is null



      
    ) dbt_internal_test