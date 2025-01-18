with 
    stg_aw__salesorderheader as (
        select 
            credit_card_id
            , sales_order_id
            , customer_id
            , sales_person_id
            , rowguid
        from {{ ref('stg_aw__salesorderheader') }}
    )

    , stg_aw__creditcard as (
        select 
            credit_card_id
            , card_type
            , exp_month
            , exp_year
        from {{ ref('stg_aw__creditcard') }}
    )

    , dim_creditcard as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'stg_aw__salesorderheader.credit_card_id'
            ]) }} as creditcard_sk
            , stg_aw__salesorderheader.sales_order_id
            , stg_aw__salesorderheader.customer_id
            , coalesce(stg_aw__salesorderheader.sales_person_id, 0) as sales_person_id
            , coalesce(stg_aw__salesorderheader.credit_card_id, 0) as credit_card_id
            , coalesce(stg_aw__creditcard.card_type, 'other method') as card_type
            , stg_aw__creditcard.exp_month
            , stg_aw__creditcard.exp_year
            , row_number() over (partition by stg_aw__salesorderheader.credit_card_id order by stg_aw__salesorderheader.credit_card_id) as row_number
        from stg_aw__salesorderheader
        left join stg_aw__creditcard 
            on stg_aw__salesorderheader.credit_card_id = stg_aw__creditcard.credit_card_id
        qualify row_number = 1
    )

select *
from dim_creditcard
