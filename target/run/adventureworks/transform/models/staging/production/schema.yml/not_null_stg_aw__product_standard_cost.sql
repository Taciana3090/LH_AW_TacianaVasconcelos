select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select standard_cost
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
where standard_cost is null



      
    ) dbt_internal_test