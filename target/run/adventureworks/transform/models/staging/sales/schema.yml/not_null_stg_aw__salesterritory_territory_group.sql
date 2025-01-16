select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select territory_group
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesterritory
where territory_group is null



      
    ) dbt_internal_test