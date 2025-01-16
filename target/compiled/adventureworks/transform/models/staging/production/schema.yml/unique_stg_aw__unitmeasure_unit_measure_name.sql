
    
    

select
    unit_measure_name as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__unitmeasure
where unit_measure_name is not null
group by unit_measure_name
having count(*) > 1


