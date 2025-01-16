select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select salesorder_fk as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
    where salesorder_fk is not null
),

parent as (
    select sales_order_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test