
  create or replace   view SANDBOX.DEV_TACIANA_VASCONCELOS.stg_aw__businessidentitycontact
  
   as (
    with 
    businessentitycontact as (
        select
            businessentityid as business_entity_id
            , personid as person_id
            , contacttypeid as contact_type_id
            , rowguid
            , cast(modifieddate as datetime) as modified_date
            , _sdc_extracted_at 
            , _sdc_received_at 
            , _sdc_batched_at
            , _sdc_sequence
            , _sdc_sync_started_at
        from RAW_AW.person.businessentitycontact
    )

select * from businessentitycontact
  );

