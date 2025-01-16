select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select business_entity_id as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesperson
    where business_entity_id is not null
),

parent as (
    select business_entity_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__employee
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test