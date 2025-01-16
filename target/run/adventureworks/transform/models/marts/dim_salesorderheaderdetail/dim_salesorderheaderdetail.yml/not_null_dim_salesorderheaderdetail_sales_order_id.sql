select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sales_order_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
where sales_order_id is null



      
    ) dbt_internal_test