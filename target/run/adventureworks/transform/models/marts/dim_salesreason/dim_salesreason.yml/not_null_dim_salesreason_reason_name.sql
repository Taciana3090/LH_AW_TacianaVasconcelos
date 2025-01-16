select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select reason_name
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesreason
where reason_name is null



      
    ) dbt_internal_test