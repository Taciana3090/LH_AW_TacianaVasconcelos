with 
    employee as (
        select
            businessentityid as business_entity_id
            , nationalidnumber as national_id_number
            , loginid as login_id
            , case
                when jobtitle = 'North American Sales Manager' then 'Gerente de Vendas Norte-Americano'
                when jobtitle = 'Sales Representative' then 'Representante de vendas'
                when jobtitle = 'European Sales Manager' then 'Gerente de Vendas Europeu'
                when jobtitle = 'Pacific Sales Manager' then 'Gerente de Vendas do Pacífico'
            end as job_title
            , birthdate as birth_date
            , maritalstatus as marital_status
            , gender
            , hiredate as hire_date
            , salariedflag as salaried_flag
            , vacationhours as vacation_hours
            , sickleavehours as sick_leave_hours
            , currentflag as current_flag
            , rowguid
            , date(modifieddate) as modified_date
            
            /* meltano extraction */
            , _sdc_extracted_at
            , _sdc_received_at
            , _sdc_batched_at
            , _sdc_deleted_at
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_sync_started_at
        from RAW_AW.humanresources.employee
    )

select * from employee