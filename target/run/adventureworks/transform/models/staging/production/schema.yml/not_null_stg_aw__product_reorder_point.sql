select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select reorder_point
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
where reorder_point is null



      
    ) dbt_internal_test