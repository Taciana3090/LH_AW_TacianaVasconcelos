select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    credit_card_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_creditcard
where credit_card_id is not null
group by credit_card_id
having count(*) > 1



      
    ) dbt_internal_test