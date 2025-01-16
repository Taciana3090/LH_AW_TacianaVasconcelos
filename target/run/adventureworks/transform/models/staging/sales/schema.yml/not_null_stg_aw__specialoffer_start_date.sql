select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select start_date
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__specialoffer
where start_date is null



      
    ) dbt_internal_test