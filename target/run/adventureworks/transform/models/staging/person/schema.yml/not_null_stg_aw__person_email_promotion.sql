select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select email_promotion
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__person
where email_promotion is null



      
    ) dbt_internal_test