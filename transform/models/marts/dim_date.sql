with 
    date_series as (
           {{ dbt_utils.date_spine(
                datepart="day",
                start_date= "cast('2011-05-01' as date)", 
                end_date="cast('2014-07-31' as date)"
           )
           }}
    )

    , date_columns as (
        select distinct
            date(date_day) as metric_date
            , extract(day from date_day) as day
            , extract(month from date_day) as month
            , extract(year from date_day) as year
            , extract(quarter from date_day) as quarter
        from date_series
    )

    , month_columns as (
        select
            *
            , case
                when month = 1 then 'Jan'
                when month = 2 then 'Fev'
                when month = 3 then 'Mar'
                when month = 4 then 'Abr'
                when month = 5 then 'Mai'
                when month = 6 then 'Jun'
                when month = 7 then 'Jul'
                when month = 8 then 'Ago'
                when month = 9 then 'Set'
                when month = 10 then 'Out'
                when month = 11 then 'Nov'
                when month = 12 then 'Dez'
            end as fullmonth
        from date_columns
    )

    , data_dim as (
        select
            {{ dbt_utils.generate_surrogate_key(['metric_date']) }} as date_sk
            , metric_date
            , day
            , month
            , year
            , quarter
            , fullmonth
        from month_columns
    )

select *
from data_dim
