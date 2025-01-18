
  
    

        create or replace transient table SANDBOX.DEV_TACIANA_VASCONCELOS.int_product
         as
        (with 
    product as (
        select 
            product_id 
            , product_subcategory_id
            , product_name
            , product_number 
            , color 
            , standard_cost 
            , listprice
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__product
    )

    , productsubcategory as (
        select 
            product_subcategory_id
            , product_category_id
            , name_product_subcategory
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productsubcategory
    )

    , productcategory as (
        select 
            product_category_id
            , name_product_category
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__productcategory
    )

    , int_item_catalog as (
        select
            p.product_id 
            , p.product_name
            , p.product_number 
            , coalesce(p.color, 'not informed') as color
            , p.standard_cost 
            , p.listprice
            , coalesce(ps.product_subcategory_id, 0) product_subcategory_id
            , coalesce( ps.name_product_subcategory, 'not informed') as name_product_subcategory
            , pc.name_product_category
        from product p
        left join productsubcategory ps on p.product_subcategory_id = ps.product_subcategory_id
        left join productcategory pc on ps.product_category_id = pc.product_category_id
    )

select *
from int_item_catalog
        );
      
  