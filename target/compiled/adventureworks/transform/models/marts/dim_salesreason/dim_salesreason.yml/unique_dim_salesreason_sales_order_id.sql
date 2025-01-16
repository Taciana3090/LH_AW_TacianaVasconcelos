
    
    

select
    sales_order_id as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.dim_salesreason
where sales_order_id is not null
group by sales_order_id
having count(*) > 1


