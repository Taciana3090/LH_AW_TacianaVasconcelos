with
    specialoffer as (
        select
            specialofferid as special_offer_id
            , description as description_discount
            , discountpct as discount_pct
            , type as type_discount
            , category
            , startdate as start_date
            , enddate as end_date
            , minqty as min_quantity
            , maxqty as max_quantity
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from {{source('db_aw_sales','specialoffer')}}
    )
select *
from specialoffer