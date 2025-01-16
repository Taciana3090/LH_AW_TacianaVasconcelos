select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select salesorderheader_sk
from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
where salesorderheader_sk is null



      
    ) dbt_internal_test