select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select standard_cost
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_item
where standard_cost is null



      
    ) dbt_internal_test