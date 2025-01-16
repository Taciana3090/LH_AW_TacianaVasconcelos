select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select store_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.int_client_details
where store_id is null



      
    ) dbt_internal_test