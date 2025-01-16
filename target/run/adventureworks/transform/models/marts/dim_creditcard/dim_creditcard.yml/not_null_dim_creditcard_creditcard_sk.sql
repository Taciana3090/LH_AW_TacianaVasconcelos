select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select creditcard_sk
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_creditcard
where creditcard_sk is null



      
    ) dbt_internal_test