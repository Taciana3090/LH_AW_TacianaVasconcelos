
    
    

select
    unit_measure_code as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__unitmeasure
where unit_measure_code is not null
group by unit_measure_code
having count(*) > 1


