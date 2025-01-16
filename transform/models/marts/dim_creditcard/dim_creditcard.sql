with 
    stg_aw__salesorderheader as (
        select 
            distinct credit_card_id
        from {{ ref('stg_aw__salesorderheader') }}
        where credit_card_id is not null
    )

    , stg_aw__creditcard as (
        select 
            credit_card_id
            ,card_type
            ,card_number_masked
            ,exp_month
            ,exp_year
        from {{ ref('stg_aw__creditcard') }}
    )

    , dim_creditcard as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'stg_aw__salesorderheader.credit_card_id',
                'stg_aw__creditcard.credit_card_id'
            ]) }} as creditcard_sk
            ,stg_aw__salesorderheader.credit_card_id
            ,stg_aw__creditcard.card_type
            ,stg_aw__creditcard.card_number_masked
            ,stg_aw__creditcard.exp_month
            ,stg_aw__creditcard.exp_year
        from stg_aw__salesorderheader
        left join stg_aw__creditcard 
            on stg_aw__salesorderheader.credit_card_id = stg_aw__creditcard.credit_card_id
    )

select *
from dim_creditcard
