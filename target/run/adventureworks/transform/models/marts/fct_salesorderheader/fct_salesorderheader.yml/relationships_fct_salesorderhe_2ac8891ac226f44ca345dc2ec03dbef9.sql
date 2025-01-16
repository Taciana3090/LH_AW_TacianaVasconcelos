select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select creditcard_fk as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
    where creditcard_fk is not null
),

parent as (
    select creditcard_sk as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_creditcard
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test