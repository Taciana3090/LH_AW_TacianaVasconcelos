select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    salesorder_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesorderheaderdetail
where salesorder_sk is not null
group by salesorder_sk
having count(*) > 1



      
    ) dbt_internal_test