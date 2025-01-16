select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select country_region_code
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesterritory
where country_region_code is null



      
    ) dbt_internal_test