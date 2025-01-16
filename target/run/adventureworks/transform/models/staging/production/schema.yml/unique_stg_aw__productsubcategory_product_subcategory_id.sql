select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    product_subcategory_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productsubcategory
where product_subcategory_id is not null
group by product_subcategory_id
having count(*) > 1



      
    ) dbt_internal_test