with
    productcategory as (
        select
            productcategoryid as product_category_id
            , name as name_product_category
            , date(modifieddate) as modified_date	
            , rowguid
            , _sdc_extracted_at 
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from {{source('db_aw_production','productcategory')}}
    )

select *
from productcategory

