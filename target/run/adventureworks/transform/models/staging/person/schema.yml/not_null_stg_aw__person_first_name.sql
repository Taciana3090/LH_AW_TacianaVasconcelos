select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select first_name
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__person
where first_name is null



      
    ) dbt_internal_test