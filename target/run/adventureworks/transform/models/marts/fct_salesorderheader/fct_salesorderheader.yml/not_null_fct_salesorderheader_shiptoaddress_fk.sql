select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select shiptoaddress_fk
from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
where shiptoaddress_fk is null



      
    ) dbt_internal_test