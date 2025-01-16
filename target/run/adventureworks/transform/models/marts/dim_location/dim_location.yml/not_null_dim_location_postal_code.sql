select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select postal_code
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_location
where postal_code is null



      
    ) dbt_internal_test