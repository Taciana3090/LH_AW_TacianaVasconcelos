select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select postal_code
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__address
where postal_code is null



      
    ) dbt_internal_test