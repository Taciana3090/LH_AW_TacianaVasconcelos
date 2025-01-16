select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name_country
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion
where name_country is null



      
    ) dbt_internal_test