select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select is_only_state_province_flag
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__stateprovince
where is_only_state_province_flag is null



      
    ) dbt_internal_test