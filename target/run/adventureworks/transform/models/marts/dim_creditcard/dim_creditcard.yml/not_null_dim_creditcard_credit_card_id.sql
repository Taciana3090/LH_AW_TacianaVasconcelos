select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select credit_card_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_creditcard
where credit_card_id is null



      
    ) dbt_internal_test