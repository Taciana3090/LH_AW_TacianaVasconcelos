with 
    int_salesorderdetail as (
        select
            distinct(product_id)
        from {{ ref('stg_aw__salesorderdetail') }}
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
            , color
        from {{ ref('int_product') }}
    )

    , dim_item as (
        select 
            {{ dbt_utils.generate_surrogate_key (
                ['int_product.product_id']
            ) }} as dim_item_sk
            , int_product.product_id
            , int_product.product_name
            , int_product.standard_cost 
            , int_product.listprice 
            , int_product.name_product_subcategory
            , int_product.name_product_category
            , int_product.color
            , row_number() over (partition by int_product.product_id order by int_product.product_id) as row_number
        from int_salesorderdetail
        left join int_product 
            on int_salesorderdetail.product_id = int_product.product_id
        qualify row_number = 1
    )

select *
from dim_item
