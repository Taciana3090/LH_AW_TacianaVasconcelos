
    
    

select
    shiptoaddress_sk as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_location
where shiptoaddress_sk is not null
group by shiptoaddress_sk
having count(*) > 1


