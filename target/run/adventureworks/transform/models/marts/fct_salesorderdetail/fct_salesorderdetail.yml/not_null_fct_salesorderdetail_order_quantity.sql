select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select order_quantity
from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderdetail
where order_quantity is null



      
    ) dbt_internal_test