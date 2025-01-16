select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sales_quota
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salespersonquotahistory
where sales_quota is null



      
    ) dbt_internal_test