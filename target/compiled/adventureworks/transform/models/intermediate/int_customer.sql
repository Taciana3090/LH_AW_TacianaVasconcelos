with 
    customer_base as (
        select
            customer_id
            , person_id
            , coalesce(store_id,  0) as store_id
            , territory_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__customer
    ) 
    
    , state_province_info as (
        select
            state_province_id
            , state_province_code
            , countryregion_code
            , state_province_name
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__stateprovince
    )

    , person_info as (
        select
            business_entity_id
            , first_name
            , middle_name
            , last_name
            , name_title
            , case
                when person_type = 'SC' then 'store contact'
                when person_type = 'IN' then 'individual customer'
                when person_type = 'SP' then 'sales person'
                when person_type = 'EM' then 'employee'
                when person_type = 'VC' then 'vendor'
                when person_type = 'GC' then 'general contact'
            end as person_type
            , name_suffix
            , email_promotion
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__person
    )

    , email_info as (
        select
            business_entity_id
            , email_address
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__emailaddress
    )

    , business_entity_address as (
        select
            business_entity_id
            , address_id
            , address_type_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__businessentityaddress
        where address_type_id = 2
    )

    , address_info as (
        select
            address_id
            , state_province_id
            , lower(city) as city_district_name
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__address 
    )

    , country_region_info as(
        select
            countryregion_code
            , country_name
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion
    )

    , store_info as (
        select
            business_entity_id
            , sales_person_id
            , store_name
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__store
    )

    , int_client_details as (
        select 
            cb.customer_id
            , cb.person_id
            , cb.store_id
            , cb.territory_id
            , pi.first_name
            , pi.middle_name
            , pi.last_name
            , coalesce(pi.name_title, 'no title') as name_title
            , pi.person_type
            , coalesce(pi.name_suffix, 'no suffix') as name_suffix
            , pi.email_promotion
            , ei.email_address
            , ai.state_province_id
            , sp.state_province_name
            , cr.countryregion_code
            , ai.city_district_name
            , coalesce(st.store_name, 'not informed') as store_name
            , coalesce(pi.name_title || ' ', '') || 
              coalesce(pi.first_name, '') || ' ' || 
              coalesce(pi.middle_name || ' ', '') || 
              coalesce(pi.last_name, '') || 
              coalesce(', ' || pi.name_suffix, '') as full_name
        from customer_base cb
        left join person_info pi 
            on cb.person_id = pi.business_entity_id
        left join email_info ei 
            on cb.person_id = ei.business_entity_id
        left join business_entity_address bea 
            on cb.person_id = bea.business_entity_id
        left join address_info ai 
            on bea.address_id = ai.address_id
        left join state_province_info sp 
            on ai.state_province_id = sp.state_province_id
        left join country_region_info cr 
            on sp.countryregion_code = cr.countryregion_code
        left join store_info st 
            on cb.store_id = st.business_entity_id
    )

select *
from int_client_details