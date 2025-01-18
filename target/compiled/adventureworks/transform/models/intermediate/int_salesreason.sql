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
        order by reason_type asc
    )

    , aggregated_reasons as (
        select 
            sales_order_id
            , listagg(reason_type, ', ') within group (order by reason_type) as agg_reason_type
            , listagg(reason_name, ', ') within group (order by reason_name) as agg_reason_name
        from salesreason_combined
        group by sales_order_id
    )
    
    , replaced_reasons as (
        select 
            sales_order_id
            , replace(replace(agg_reason_type, 'Other, Other', 'Other'), 'Other, Promotion', 'Promotion') as reason_type
            , replace(agg_reason_name, 'Other, Other', 'Other') as reason_name
        from aggregated_reasons
    )
    
    , final_result as (
        select 
            sales_order_id
            , ifnull(reason_type, 'Não definido') as reason_type
            , ifnull(reason_name, 'Não definido') as reason_name
        from replaced_reasons
    )

select * 
from final_result