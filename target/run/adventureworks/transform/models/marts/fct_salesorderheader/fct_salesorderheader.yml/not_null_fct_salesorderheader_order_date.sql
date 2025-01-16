select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select order_date
from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
where order_date is null



      
    ) dbt_internal_test