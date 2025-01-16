
  
    

        create or replace transient table SANDBOX.DEV_TACIANA_VASCONCELOS.dim_location
         as
        (with 
	stg_aw__salesorderheader as(
		select
			distinct(ship_to_address_id)
		from SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__salesorderheader
	)

	, int_location as (
		select
			address_id 
			, address_line
			, city 
			, state_province_id 
			, postal_code 
			, state_province_code 
			, countryregion_code 
			, state_province_name
			, sales_territory_id
			, country_name
		from SANDBOX.DEV_TACIANA_VASCONCELOS.int_location
	)

	, dim_location as (
		select
			md5(cast(coalesce(cast(stg_aw__salesorderheader.ship_to_address_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(int_location.address_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as shiptoaddress_sk
			, address_id as ship_to_address_id
			, int_location.address_line
			, int_location.city 
			, int_location.postal_code 
			, int_location.state_province_name
			, int_location.country_name
		from stg_aw__salesorderheader
		left join int_location on stg_aw__salesorderheader.ship_to_address_id = int_location.address_id
	)

select *
from dim_location
        );
      
  