select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select email_address_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__emailaddress
where email_address_id is null



      
    ) dbt_internal_test