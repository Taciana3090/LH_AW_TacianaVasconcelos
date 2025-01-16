select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select days_to_manufacture
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
where days_to_manufacture is null



      
    ) dbt_internal_test