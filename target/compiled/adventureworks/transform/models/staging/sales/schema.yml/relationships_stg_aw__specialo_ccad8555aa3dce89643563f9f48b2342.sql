
    
    

with child as (
    select special_offer_id as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__specialofferproduct
    where special_offer_id is not null
),

parent as (
    select special_offer_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__specialoffer
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


