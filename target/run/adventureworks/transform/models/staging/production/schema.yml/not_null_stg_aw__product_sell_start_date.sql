select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sell_start_date
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
where sell_start_date is null



      
    ) dbt_internal_test