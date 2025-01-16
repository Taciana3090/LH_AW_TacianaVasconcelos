select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_model_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productmodel
where product_model_id is null



      
    ) dbt_internal_test