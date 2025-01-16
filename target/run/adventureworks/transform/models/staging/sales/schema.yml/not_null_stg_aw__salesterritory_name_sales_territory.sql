select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name_sales_territory
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesterritory
where name_sales_territory is null



      
    ) dbt_internal_test