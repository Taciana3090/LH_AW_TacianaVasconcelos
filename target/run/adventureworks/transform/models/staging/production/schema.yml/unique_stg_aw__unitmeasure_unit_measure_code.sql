select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    unit_measure_code as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__unitmeasure
where unit_measure_code is not null
group by unit_measure_code
having count(*) > 1



      
    ) dbt_internal_test