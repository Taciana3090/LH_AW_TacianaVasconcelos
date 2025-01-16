
  
    

        create or replace transient table SANDBOX.DEV_TACIANA_VASCONCELOS.dim_creditcard
         as
        (with 
    stg_aw__salesorderheader as (
        select 
            distinct credit_card_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderheader
        where credit_card_id is not null
    )

    , stg_aw__creditcard as (
        select 
            credit_card_id
            ,card_type
            ,card_number_masked
            ,exp_month
            ,exp_year
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__creditcard
    )

    , dim_creditcard as (
        select
            md5(cast(coalesce(cast(stg_aw__salesorderheader.credit_card_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(stg_aw__creditcard.credit_card_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as creditcard_sk
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
        );
      
  