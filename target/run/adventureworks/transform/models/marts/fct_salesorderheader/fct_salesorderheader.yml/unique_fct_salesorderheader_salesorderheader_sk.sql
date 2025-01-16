select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    salesorderheader_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.fct_salesorderheader
where salesorderheader_sk is not null
group by salesorderheader_sk
having count(*) > 1



      
    ) dbt_internal_test