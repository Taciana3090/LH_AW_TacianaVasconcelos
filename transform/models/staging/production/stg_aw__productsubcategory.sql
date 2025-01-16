with
    productsubcategory as (
        select
            productsubcategoryid as product_subcategory_id
            , productcategoryid as product_category_id
            , name as name_product_subcategory
            , rowguid
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from {{source('db_aw_production','productsubcategory')}}
    )

select *
from productsubcategory


 			