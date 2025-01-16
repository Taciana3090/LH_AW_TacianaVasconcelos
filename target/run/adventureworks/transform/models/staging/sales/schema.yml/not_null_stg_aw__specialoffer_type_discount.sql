select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select type_discount
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__specialoffer
where type_discount is null



      
    ) dbt_internal_test