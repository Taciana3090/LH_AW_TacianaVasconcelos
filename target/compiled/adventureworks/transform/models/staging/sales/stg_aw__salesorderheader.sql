with 
    salesorderheader as (
        select
            salesorderid as sales_order_id
            , customerid as customer_id
            , salespersonid as sales_person_id
            , territoryid as territory_id
            , billtoaddressid as bill_to_address_id
            , shiptoaddressid as ship_to_address_id
            , creditcardid as credit_card_id
            , currencyrateid as currency_rate_id
            , shipmethodid as ship_method_id
            , cast(orderdate as datetime) as order_date
            , cast(duedate as datetime) as due_date
            , cast(shipdate as datetime) as ship_date
            , status
            , purchaseordernumber as purchase_order_number
            , creditcardapprovalcode as creditcard_approval_code			
            , accountnumber as account_number	
            , case
                when onlineorderflag = 't' then true
                when onlineorderflag = 'f' then false
                else null
            end as online_order_flag
            , subtotal as sub_total
            , taxamt as taxa_amount
            , freight
            , totaldue as total_due
            , rowguid					
            , date(modifieddate) as modified_date					
            , revisionnumber as revision_number
            , comment	  
            /* meltano extraction */
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at

         from RAW_AW.sales.salesorderheader
    )


select  *
from salesorderheader