select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select state_province_name
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__stateprovince
where state_province_name is null



      
    ) dbt_internal_test