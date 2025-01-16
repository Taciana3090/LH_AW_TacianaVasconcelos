
    
    

with child as (
    select address_type_id as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__businessentityaddress
    where address_type_id is not null
),

parent as (
    select address_type_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__addresstype
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


