select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select product_subcategory_id as from_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
    where product_subcategory_id is not null
),

parent as (
    select product_subcategory_id as to_field
    from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productsubcategory
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test