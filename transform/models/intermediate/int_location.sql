with 
    address as (
        select 
            address_id
            , address_line
            , city
            , state_province_id
            , postal_code
        from {{ ref('stg_aw__address') }}
    )

    , stateprovince as (
        select 
            state_province_id
            , state_province_code
            , countryregion_code
            , state_province_name
            , sales_territory_id
        from {{ ref('stg_aw__stateprovince') }}
    )

    , countryregion as (
        select 
            countryregion_code
            , country_name
        from {{ ref('stg_aw__countryregion') }}
    )

    , salesterritory as (
        select
            territory_id
            , countryregion_code
            , territory_name
            , territory_group
            , sales_year_to_end
            , sales_last_year
            , cost_year_to_end
            , cost_last_year
        from {{ref('stg_aw__salesterritory')}}

    )

    , int_location_performance as (
        select
            a.address_id
            , a.address_line
            , a.city
            , a.state_province_id
            , a.postal_code
            , sp.state_province_code
            , sp.countryregion_code
            , sp.state_province_name
            , sp.sales_territory_id
            , cr.country_name
        from address a
        left join stateprovince sp on a.state_province_id = sp.state_province_id
        left join countryregion cr on sp.countryregion_code = cr.countryregion_code
        left join salesterritory st on sp.sales_territory_id = st.territory_id
    )

select *
from int_location_performance
