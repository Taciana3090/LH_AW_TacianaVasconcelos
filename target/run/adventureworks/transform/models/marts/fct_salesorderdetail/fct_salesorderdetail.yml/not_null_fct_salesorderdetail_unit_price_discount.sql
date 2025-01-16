select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select unit_price_discount
from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderdetail
where unit_price_discount is null



      
    ) dbt_internal_test