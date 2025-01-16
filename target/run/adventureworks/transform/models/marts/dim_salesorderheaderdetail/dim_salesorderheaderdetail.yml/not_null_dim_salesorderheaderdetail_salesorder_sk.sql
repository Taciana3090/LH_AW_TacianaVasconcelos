select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select salesorder_sk
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
where salesorder_sk is null



      
    ) dbt_internal_test