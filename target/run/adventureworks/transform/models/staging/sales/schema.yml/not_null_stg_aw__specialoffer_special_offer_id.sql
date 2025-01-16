select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select special_offer_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__specialoffer
where special_offer_id is null



      
    ) dbt_internal_test