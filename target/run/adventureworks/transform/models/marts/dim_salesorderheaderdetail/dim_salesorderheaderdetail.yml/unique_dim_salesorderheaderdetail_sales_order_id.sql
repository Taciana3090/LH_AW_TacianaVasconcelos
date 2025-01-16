select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    sales_order_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
where sales_order_id is not null
group by sales_order_id
having count(*) > 1



      
    ) dbt_internal_test