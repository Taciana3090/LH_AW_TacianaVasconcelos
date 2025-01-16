
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
  
   as (
    with
    product as (
        select
            productid as product_id
            , productsubcategoryid as product_subcategory_id	
            , productmodelid as product_model_id
            , productnumber as product_number	
            , name as product_name
            , productline as product_line	
            , color	
            , style				
            , size
            , sizeunitmeasurecode as size_unit_measure_code 
            , weightunitmeasurecode as weight_unit_measure_code
            , weight        
            , listprice					
            , class					
            , standardcost as standard_cost					
            , daystomanufacture as days_to_manufacture
            , reorderpoint as reorder_point		
            , safetystocklevel as safety_stock_level				
            , case
                when makeflag = 't' then true
            end as make_flag
            , case
                when finishedgoodsflag = 't' then true
            end as finished_goods_flag
            , sellstartdate as sell_start_date
            , sellenddate as sell_end_date
            , discontinueddate as discontinued_date			
            , date(modifieddate) as modified_date
            , rowguid
            , _sdc_extracted_at 
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.production.product
    )

select *
from product
  );

