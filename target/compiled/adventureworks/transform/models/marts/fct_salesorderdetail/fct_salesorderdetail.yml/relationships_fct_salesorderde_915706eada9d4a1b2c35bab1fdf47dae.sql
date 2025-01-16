
    
    

with child as (
    select salesorderdetail_fk as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderdetail
    where salesorderdetail_fk is not null
),

parent as (
    select sales_order_detail_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


