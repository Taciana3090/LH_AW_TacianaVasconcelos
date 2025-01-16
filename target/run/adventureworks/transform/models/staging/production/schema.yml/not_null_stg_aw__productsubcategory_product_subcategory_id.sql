select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_subcategory_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productsubcategory
where product_subcategory_id is null



      
    ) dbt_internal_test