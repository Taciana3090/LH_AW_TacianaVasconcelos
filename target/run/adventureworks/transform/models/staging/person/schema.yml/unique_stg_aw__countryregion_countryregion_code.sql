select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    countryregion_code as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion
where countryregion_code is not null
group by countryregion_code
having count(*) > 1



      
    ) dbt_internal_test