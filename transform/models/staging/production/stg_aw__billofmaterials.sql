with
    billofmaterials as (
        select
            billofmaterialsid as bill_of_materials_id
            , productassemblyid as product_assembly_id
            , componentid as component_id
            , unitmeasurecode as unit_measure_code
            , bomlevel as bom_level
            , perassemblyqty as per_assembly_quantity
            , date(modifieddate) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from {{source('db_aw_production','billofmaterials')}}
    )

select *
from billofmaterials
