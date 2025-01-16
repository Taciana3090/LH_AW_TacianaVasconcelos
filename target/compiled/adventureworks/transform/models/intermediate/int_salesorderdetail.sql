with 
    salesorderdetail as (
        select 
            sales_order_id
            ,sales_order_detail_id
            ,order_quantity
            ,product_id
            ,unit_price
            ,unit_price_discount
            ,(order_quantity * unit_price) as grossrevenue
            ,(order_quantity * unit_price * unit_price_discount) as discount
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderdetail
    )

select *
from salesorderdetail