select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ship_to_address_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_location
where ship_to_address_id is null



      
    ) dbt_internal_test