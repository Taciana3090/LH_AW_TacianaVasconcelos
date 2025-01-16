
    
    

with child as (
    select sales_order_id as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesreason
    where sales_order_id is not null
),

parent as (
    select sales_order_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderheader
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


