with 
    salesorderheadersalesreason as (
        select 
            sales_order_id
            , sales_reason_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderheadersalesreason
    )

    , reason_details as (
        select 
            sales_reason_id
            , reason_name
            , reason_type
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesreason
    )

    , salesreason_combined as (
        select
            soh_sr.sales_order_id
            , soh_sr.sales_reason_id
            , rd.reason_name
            , rd.reason_type
        from salesorderheadersalesreason soh_sr
        left join reason_details rd on soh_sr.sales_reason_id = rd.sales_reason_id
    )

select *
from salesreason_combined