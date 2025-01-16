select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select countryregion_code
from SANDBOX.DEV_TACIANA_VASCONCELOS.int_location
where countryregion_code is null



      
    ) dbt_internal_test