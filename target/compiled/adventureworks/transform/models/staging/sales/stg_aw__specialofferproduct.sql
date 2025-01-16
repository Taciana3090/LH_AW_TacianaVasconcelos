with
    specialofferproduct as (
        select

            specialofferid as special_offer_id
            , productid as product_id
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.sales.specialofferproduct
    )

select *
from specialofferproduct