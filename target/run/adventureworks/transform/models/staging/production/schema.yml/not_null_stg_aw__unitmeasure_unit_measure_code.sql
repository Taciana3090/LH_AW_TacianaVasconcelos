select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select unit_measure_code
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__unitmeasure
where unit_measure_code is null



      
    ) dbt_internal_test