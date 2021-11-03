with
    source_data as (
        select 
         /* Primary Key*/ 
            product_id
            ,order_id            
            ,discount	
            ,unit_price	
            ,quantity

            /* stich comulns*/  
            ,_sdc_sequence
            ,_sdc_table_version
            ,_sdc_received_at	
            ,_sdc_batched_at	
            from {{source('northwind_etl2', 'order_details')}}

    )


    select * from source_data