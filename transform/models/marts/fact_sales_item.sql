with 
    int_sales as (
        select
            sales_order_id
            , sales_order_detail_id
            , customer_id
            , order_date
            , online_order
            , sales_person_id
            , territory_id
            , bill_to_address_id
            , ship_to_address_id
            , ship_method_id
            , paid_with_credit_card
            , credit_card_id
            , reason_type
            , card_type
            , status
            , carrier_tracking_number
            , product_id
            , order_quantity
            , unit_price
            , unit_price_discount
            , sub_total_fixed
            , freight_fixed
            , tax_fixed
            , total_due_fixed
            , total_gross
        from {{ ref('int_sales') }}
    )

    , sales_with_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['sales_order_id','sales_order_detail_id']) }} as sales_id_sk
            , {{ dbt_utils.generate_surrogate_key(['sales_person_id']) }} as sales_person_id_fk
            , {{ dbt_utils.generate_surrogate_key(['product_id']) }} as dim_item_fk
            , {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as dim_client_fk
            , {{ dbt_utils.generate_surrogate_key(['ship_to_address_id']) }} as dim_location_fk
            , {{ dbt_utils.generate_surrogate_key(['credit_card_id']) }} as dim_creditcard_fk
            , {{ dbt_utils.generate_surrogate_key(['reason_type']) }} as dim_salesreason_fk
            , order_date
            , online_order 
            , carrier_tracking_number
            , paid_with_credit_card
            , status
            , order_quantity
            , unit_price
            , unit_price_discount
            , sub_total_fixed
            , total_gross
            , freight_fixed
            , tax_fixed
            , total_due_fixed
            , row_number() over (partition by sales_order_id, sales_order_detail_id order by sales_order_id) as row_number
        from int_sales
        qualify row_number = 1
    )

select *
from sales_with_sk
