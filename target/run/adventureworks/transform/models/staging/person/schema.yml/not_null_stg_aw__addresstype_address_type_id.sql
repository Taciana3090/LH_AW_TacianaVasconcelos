select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select address_type_id
from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__addresstype
where address_type_id is null



      
    ) dbt_internal_test