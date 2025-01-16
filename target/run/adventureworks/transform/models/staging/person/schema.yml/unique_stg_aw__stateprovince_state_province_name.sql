select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    state_province_name as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__stateprovince
where state_province_name is not null
group by state_province_name
having count(*) > 1



      
    ) dbt_internal_test