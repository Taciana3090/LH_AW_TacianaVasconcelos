select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select person_type
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__person
where person_type is null



      
    ) dbt_internal_test