select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select bonus
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesperson
where bonus is null



      
    ) dbt_internal_test