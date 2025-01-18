with
    creditcard as (
        select
            /* primary key */
            creditcardid as credit_card_id
            , cardtype as card_type
            , cardnumber as card_number
            , expmonth as exp_month
            , expyear as exp_year
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from {{source('db_aw_sales', 'creditcard')}}
    )

select *
from creditcard
