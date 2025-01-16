
    
    

with child as (
    select product_fk as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderdetail
    where product_fk is not null
),

parent as (
    select product_sk as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_item
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


