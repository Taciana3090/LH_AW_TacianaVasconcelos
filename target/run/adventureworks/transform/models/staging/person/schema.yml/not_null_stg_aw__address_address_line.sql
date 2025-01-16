select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select address_line
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__address
where address_line is null



      
    ) dbt_internal_test