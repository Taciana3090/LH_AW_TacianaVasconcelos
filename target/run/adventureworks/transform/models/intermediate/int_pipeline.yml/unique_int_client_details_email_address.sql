select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    email_address as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.int_client_details
where email_address is not null
group by email_address
having count(*) > 1



      
    ) dbt_internal_test