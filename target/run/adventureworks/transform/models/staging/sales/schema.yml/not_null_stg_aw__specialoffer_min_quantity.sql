select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select min_quantity
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__specialoffer
where min_quantity is null



      
    ) dbt_internal_test