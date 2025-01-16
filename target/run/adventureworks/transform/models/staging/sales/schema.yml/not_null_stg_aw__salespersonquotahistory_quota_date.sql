select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select quota_date
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salespersonquotahistory
where quota_date is null



      
    ) dbt_internal_test