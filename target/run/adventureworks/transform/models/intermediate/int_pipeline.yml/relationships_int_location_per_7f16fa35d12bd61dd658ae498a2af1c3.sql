select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select countryregion_code as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.int_location_performance
    where countryregion_code is not null
),

parent as (
    select countryregion_code as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test