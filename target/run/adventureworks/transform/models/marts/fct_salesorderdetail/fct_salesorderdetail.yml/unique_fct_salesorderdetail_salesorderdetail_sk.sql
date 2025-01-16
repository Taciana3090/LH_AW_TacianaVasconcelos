select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    salesorderdetail_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderdetail
where salesorderdetail_sk is not null
group by salesorderdetail_sk
having count(*) > 1



      
    ) dbt_internal_test