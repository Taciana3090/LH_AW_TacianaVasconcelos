select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select address_type_name
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__addresstype
where address_type_name is null



      
    ) dbt_internal_test