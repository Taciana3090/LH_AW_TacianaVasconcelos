
    
    

select
    name_sales_territory as unique_field,
    count(*) as n_records

from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesterritory
where name_sales_territory is not null
group by name_sales_territory
having count(*) > 1


