select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sales_last_year
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesperson
where sales_last_year is null



      
    ) dbt_internal_test