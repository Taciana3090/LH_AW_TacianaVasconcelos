with 
     customer_info as (
        select
            customer_id
            , person_id
            , store_id
            , territory_id
        from {{ ref('stg_aw__customer') }}    
    )

    , person_info as (
        select
            business_entity_id
            , case
                when person_type = 'sc' then 'store contact'
                when person_type = 'in' then 'individual customer'
                when person_type = 'sp' then 'sales person'
                when person_type = 'em' then 'employee'
                when person_type = 'vc' then 'vendor'
                when person_type = 'gc' then 'general contact'
            end as person_type
            , concat(first_name ,' ', last_name) as full_name
        from {{ ref('stg_aw__person') }}
    )

    , store_info as (
        select
            business_entity_id
            , sales_person_id
            , store_name
        from {{ ref('stg_aw__store') }}
    )

    , dim_client as (
        select
            {{ dbt_utils.generate_surrogate_key(
                ['customer_info.customer_id']
            ) }} as customer_sk
            , customer_info.customer_id
            , customer_info.person_id
            , coalesce(store_info.store_name, 'not informed') as store_name
            , coalesce(customer_info.store_id, 0) as store_id
            , customer_info.territory_id
            , person_info.full_name
            , row_number() over (partition by customer_id order by customer_id) as row_number
        from customer_info
        left join person_info 
            on customer_info.person_id = person_info.business_entity_id
        left join store_info 
            on customer_info.store_id = store_info.business_entity_id
        where customer_info.person_id is not null
        qualify row_number = 1
    )

select *
from dim_client
