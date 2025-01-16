select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sales_person_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__store
where sales_person_id is null



      
    ) dbt_internal_test