
    
    

with child as (
    select product_id as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_item
    where product_id is not null
),

parent as (
    select product_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.int_product
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


