
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__business_identity_contact
  
   as (
    with 
    businessentitycontact as (
        select
            /* primary key e FK*/
            businessentityid as business_entity_id
            , contacttypeid as contact_type_id
            , personid as person_id

            , rowguid
            , date(modifieddate) as modified_date

        from RAW_AW.person.businessentitycontact
    )

select * from source
  );

