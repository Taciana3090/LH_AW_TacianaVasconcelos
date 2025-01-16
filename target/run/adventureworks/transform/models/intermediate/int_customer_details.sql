
  
    

        create or replace transient table SANDBOX.DEV_TACIANA_VASCONCELOS.int_customer_details
         as
        (with 
    customer_base as (
        select
            customer_id
            ,person_id
            ,coalesce(store_id, 0) as store_id
            ,territory_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__customer
    ),
    state_province as (
        select
            state_province_id
            ,state_province_code
            ,country_region_code
            ,state_province_name
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__stateprovince
    ),
    person_info as (
        select
            business_entity_id
            ,first_name
            ,middle_name
            ,last_name
            ,name_title
            ,case
                when person_type = 'SC' then 'Store Contact'
                when person_type = 'IN' then 'Individual Customer'
                when person_type = 'SP' then 'Sales Person'
                when person_type = 'EM' then 'Employee'
                when person_type = 'VC' then 'Vendor'
                when person_type = 'GC' then 'General Contact'
            end as person_type
            ,name_suffix
            ,email_promotion
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__person
    ),
    email_info as (
        select
            business_entity_id
            ,email_address
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__emailaddress
    ),
    business_entity_address as (
        select
            business_entity_id
            ,address_id
            ,address_type_id
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__businessentityaddress
        where address_type_id = 2
    ),
    address_info as (
        select
            a.address_id
            ,sp.state_province_id
            ,sp.state_province_name
            ,cr.country_region_code
            ,lower(a.city) as city_district_name
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__address a
        left join SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__stateprovince sp on a.state_province_id = sp.state_province_id
        left join SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__countryregion cr on sp.country_region_code = cr.country_region_code
    ),
    store_info as (
        select
            business_entity_id
            ,sales_person_id
            ,coalesce(name_store, 'not informed') as name_store
        from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__store
    ),
    int_client_details as (
        select
            cb.customer_id
            ,cb.person_id
            ,cb.store_id
            ,cb.territory_id
            ,pi.first_name
            ,pi.middle_name
            ,pi.last_name
            ,pi.name_title
            ,pi.person_type
            ,pi.name_suffix
            ,pi.email_promotion
            ,ei.email_address
            ,ai.state_province_id
            ,ai.state_province_name
            ,ai.country_region_code
            ,ai.city_district_name
            ,st.name_store
        from customer_base cb
        left join person_info pi on cb.person_id = pi.business_entity_id
        left join email_info ei on cb.person_id = ei.business_entity_id
        left join business_entity_address bea on cb.person_id = bea.business_entity_id
        left join address_info ai on bea.address_id = ai.address_id
        left join store_info st on cb.store_id = st.business_entity_id
    )
select *
from int_client_details
        );
      
  