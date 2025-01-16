with 
    stg_aw__salesorderheader as(
        select
            distinct(customer_id)
        from {{ ref('stg_aw__salesorderheader')}}
    )

    , int_customer as (
        select
            customer_id 
            , person_id 
            , store_id 
            , territory_id 
            , full_name
            , store_name
            , state_province_name
            , city_district_name
        from {{ ref('int_customer') }}    
    )

    , dim_client as (
        select
            {{ dbt_utils.generate_surrogate_key (
                ['stg_aw__salesorderheader.customer_id'
                , 'int_customer.customer_id']
            ) }} as customer_sk
            , int_customer.customer_id
            , int_customer.full_name
        from stg_aw__salesorderheader
        left join int_customer on stg_aw__salesorderheader.customer_id = int_customer.customer_id
    )

select *
from dim_client