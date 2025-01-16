select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_due
from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
where total_due is null



      
    ) dbt_internal_test