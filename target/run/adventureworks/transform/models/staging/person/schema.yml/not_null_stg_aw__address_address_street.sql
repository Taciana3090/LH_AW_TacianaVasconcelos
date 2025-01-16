select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select address_street
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__address
where address_street is null



      
    ) dbt_internal_test