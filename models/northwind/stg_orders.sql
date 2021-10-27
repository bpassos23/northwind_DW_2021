with
    source as (
        select *
             from {{source('northwind_etl2', 'orders')}}

    )


    select * from source