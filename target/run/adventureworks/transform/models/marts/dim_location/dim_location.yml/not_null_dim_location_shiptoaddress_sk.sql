select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select shiptoaddress_sk
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_location
where shiptoaddress_sk is null



      
    ) dbt_internal_test