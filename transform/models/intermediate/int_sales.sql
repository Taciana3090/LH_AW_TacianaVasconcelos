with 
    base_salesorderheader as (
        select
            sales_order_id
            , customer_id 
            , sales_person_id 
            , territory_id
            , bill_to_address_id
            , ship_to_address_id
            , credit_card_id
            , currency_rate_id
            , ship_method_id
            , case 
                when status = 1 then 'in process'
                when status = 2 then 'approved'
                when status = 3 then 'backordered'
                when status = 4 then 'rejected'
                when status = 5 then 'shipped'
                when status = 6 then 'cancelled'
            end as status
            , purchase_order_number
            , creditcard_approval_code
            , account_number
            , online_order_flag
	        , order_date
            , ship_date 
            , due_date
            , sub_total
            , taxa_amount
            , freight
            , total_due
        from {{ref('stg_aw__salesorderheader')}}
    )

    , base_salesorderdetail as (
        select
            sales_order_id
            , sales_order_detail_id
            , product_id
            , special_offer_id
            , carrier_tracking_number
            , order_quantity
            , unit_price
            , unit_price_discount
        from {{ref('stg_aw__salesorderdetail')}}
    )

    , base_salesorderheadersalesreason as (
        select
            sales_reason_id
            , sales_order_id
        from {{ref('stg_aw__salesorderheadersalesreason')}}
    )

    , base_creditcard as (
        select 
            credit_card_id
            , card_type
            , card_number
            , exp_month
            , exp_year
        from {{ref('stg_aw__creditcard')}}
    )

    , base_int_salesreason as (
        select
            sales_order_id
            , reason_type
            , reason_name
        from {{ref('int_salesreason')}}
    )

    , credit_card_union as (
        select 
            so.*
            , cc.card_type
        from base_salesorderheader so
        left join base_creditcard cc on cc.credit_card_id = so.credit_card_id
    ),

    order_detail_union as (
        select 
            cc_union.*
            , sod.sales_order_detail_id
            , sod.carrier_tracking_number
            , sod.product_id
            , sod.order_quantity
            , sod.unit_price
            , case 
                when sod.unit_price_discount != 0 then sod.unit_price_discount
                else null
            end as unit_price_discount
            , ((1 - coalesce(sod.unit_price_discount, 0)) * sod.unit_price * sod.order_quantity) as sub_total_fixed
        from base_salesorderdetail sod
        left join credit_card_union cc_union
            on cc_union.sales_order_id = sod.sales_order_id
    ),

    order_count as (
        select 
            sales_order_id
            , count(sales_order_id) as count_orders_rows
        from order_detail_union
        group by sales_order_id
    ),

    fixed_columns as (
        select
            odu.*
            , oc.count_orders_rows
            , odu.freight / oc.count_orders_rows as freight_fixed
            , odu.taxa_amount / oc.count_orders_rows as tax_fixed
        from order_detail_union odu
        left join order_count oc
            on oc.sales_order_id = odu.sales_order_id
    ),

    fixed_order_details as (
        select 
            sales_order_id
            , sales_order_detail_id
            , customer_id
            , order_date
            , case 
                when purchase_order_number is not null then 'loja física'
                else 'compra online'
            end as online_order
            , coalesce(sales_person_id, 0) as sales_person_id
            , territory_id
            , bill_to_address_id
            , ship_to_address_id
            , ship_method_id
            , case 
                when creditcard_approval_code is not null then 'cc payment'
                else 'other payment method'
            end as paid_with_credit_card
            , credit_card_id
            , card_type
            , status
            , coalesce(carrier_tracking_number, 'Não enviado') as carrier_tracking_number
            , product_id
            , order_quantity
            , unit_price
            , coalesce(unit_price_discount, 0) as unit_price_discount
            , sub_total_fixed
            , freight_fixed
            , tax_fixed
            , sub_total_fixed + freight_fixed + tax_fixed as total_due_fixed
            , unit_price * order_quantity as total_gross
        from fixed_columns
    ),

    reason_union as (
        select
            fod.*
            , ir.reason_type
        from fixed_order_details fod
        left join base_int_salesreason ir
            on ir.sales_order_id = fod.sales_order_id
    )

select * 
from reason_union
