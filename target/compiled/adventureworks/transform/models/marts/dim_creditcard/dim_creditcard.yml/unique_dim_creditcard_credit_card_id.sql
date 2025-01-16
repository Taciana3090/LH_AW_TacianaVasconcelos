
    
    

select
    credit_card_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_creditcard
where credit_card_id is not null
group by credit_card_id
having count(*) > 1


