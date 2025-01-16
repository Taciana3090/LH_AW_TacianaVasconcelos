with 
    int_salesorderdetail as (
        select
            distinct(product_id)
        from SANDBOX.DEV_TACIANA_VASCONCELOS.int_salesorderdetail   
    )

    , int_product as (
        select
            product_id 
            , product_name
            , product_number 
            , standard_cost 
            , listprice 
            , name_product_category
            , name_product_subcategory
        from SANDBOX.DEV_TACIANA_VASCONCELOS.int_product
    )

    , dim_item as (
        select 
            md5(cast(coalesce(cast(int_salesorderdetail.product_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(int_product.product_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as product_sk
            , int_product.product_id
            , int_product.product_name
            , int_product.standard_cost 
            , int_product.listprice 
            , int_product.name_product_subcategory
            , int_product.name_product_category
        from int_salesorderdetail
        left join int_product on int_salesorderdetail.product_id = int_product.product_id
    )

select *
from dim_item