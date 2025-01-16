with
    currencyrate as (
        select
            currencyrateid as currency_rate_id
            , cast(currencyratedate as datetime) as currency_rate_date
            , cast(fromcurrencycode as string) as from_currency_code
            , cast(tocurrencycode as string) as to_currency_code
            , cast(averagerate as float) as average_rate
            , cast(endofdayrate as float) as end_of_day_rate
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.currencyrate

    )
select *
from currencyrate