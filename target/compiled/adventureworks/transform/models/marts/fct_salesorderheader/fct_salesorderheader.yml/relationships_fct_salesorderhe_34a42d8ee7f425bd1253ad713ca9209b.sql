
    
    

with child as (
    select shiptoaddress_fk as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
    where shiptoaddress_fk is not null
),

parent as (
    select shiptoaddress_sk as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_location
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


