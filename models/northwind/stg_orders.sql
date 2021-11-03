with
    source_data as (
        select 

        /* Primary Key*/ 
        employee_id
        ,order_id
        ,customer_id
        ,ship_address
        ,required_date
        ,order_date	
        ,ship_name	
        ,ship_region		
        ,shipped_date		
        ,ship_country	
        ,ship_postal_code	
        ,ship_city
        ,freight
        ,ship_via

             from {{source('northwind_etl2', 'orders')}}

    )

    select * from source_data