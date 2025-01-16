
    
    

with child as (
    select person_id as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.int_customer
    where person_id is not null
),

parent as (
    select business_entity_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__person
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


