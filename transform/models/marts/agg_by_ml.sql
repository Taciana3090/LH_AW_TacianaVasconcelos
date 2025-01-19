with 
    base_data as (
        select
            soh.sales_order_id
            , soh.order_date
            , extract(year from soh.order_date) as order_year
            , sod.product_id
            , sod.line_total as sales_amount
            , st.territory_name
            , st.territory_group
            , st.countryregion_code
            , s.store_name
            , p.product_name
            , pc.name_product_category
            , ps.name_product_subcategory
            , coalesce(pi.quantity, 0) as available_inventory
            , bo.component_id
            , coalesce(bo.per_assembly_quantity, 0) as per_assembly_quantity
        from 
            {{ ref('stg_aw__salesorderheader') }} soh
        inner join 
            {{ ref('stg_aw__salesorderdetail') }} sod
            on soh.sales_order_id = sod.sales_order_id
        left join 
            {{ ref('stg_aw__salesterritory') }} st
            on soh.territory_id = st.territory_id
        left join 
            {{ ref('stg_aw__store') }} s
            on soh.customer_id = s.business_entity_id
        left join 
            {{ ref('stg_aw__product') }} p
            on sod.product_id = p.product_id
        left join 
            {{ ref('stg_aw__productsubcategory') }} ps
            on p.product_subcategory_id = ps.product_subcategory_id
        left join 
            {{ ref('stg_aw__productcategory') }} pc
            on ps.product_category_id = pc.product_category_id
        left join 
            {{ ref('stg_aw__productinventory') }} pi
            on p.product_id = pi.product_id
        left join 
            {{ ref('stg_aw__billofmaterials') }} bo
            on p.product_id = bo.product_assembly_id
    ),

    aggregated_data as (
        select
            extract(year from bd.order_date) as order_year
            , date_trunc('month', bd.order_date) as order_month
            , bd.product_id
            , bd.territory_name
            , bd.territory_group
            , bd.countryregion_code
            , bd.store_name
            , bd.product_name
            , bd.name_product_category
            , bd.name_product_subcategory
            , sum(bd.available_inventory) as total_inventory
            , count(distinct bd.sales_order_id) as total_orders
            , sum(bd.sales_amount) as total_sales
            , avg(bd.sales_amount) as avg_sales_per_order
            , min(bd.sales_amount) as min_sales
            , max(bd.sales_amount) as max_sales
            , array_agg(distinct bd.component_id) as components
            , array_agg(distinct bd.per_assembly_quantity) as assembly_quantities
        from 
            base_data bd
        group by
            extract(year from bd.order_date)
            , date_trunc('month', bd.order_date)
            , bd.product_id
            , bd.territory_name
            , bd.territory_group
            , bd.countryregion_code
            , bd.store_name
            , bd.product_name
            , bd.name_product_category
            , bd.name_product_subcategory
    )

select *
from aggregated_data
