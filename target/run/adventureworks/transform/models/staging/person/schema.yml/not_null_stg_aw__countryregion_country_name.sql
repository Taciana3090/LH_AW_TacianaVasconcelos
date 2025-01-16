select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select country_name
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion
where country_name is null



      
    ) dbt_internal_test