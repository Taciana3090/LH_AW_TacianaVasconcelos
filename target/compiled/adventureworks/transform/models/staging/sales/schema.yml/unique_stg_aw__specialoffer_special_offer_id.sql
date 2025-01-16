
    
    

select
    special_offer_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__specialoffer
where special_offer_id is not null
group by special_offer_id
having count(*) > 1


