
    
    

select
    product_model_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productmodel
where product_model_id is not null
group by product_model_id
having count(*) > 1


