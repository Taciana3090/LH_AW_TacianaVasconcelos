select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    country_region_code as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion
where country_region_code is not null
group by country_region_code
having count(*) > 1



      
    ) dbt_internal_test