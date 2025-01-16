select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_fk
from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderdetail
where product_fk is null



      
    ) dbt_internal_test