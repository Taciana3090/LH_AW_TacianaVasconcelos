select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    address_type_name as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__addresstype
where address_type_name is not null
group by address_type_name
having count(*) > 1



      
    ) dbt_internal_test