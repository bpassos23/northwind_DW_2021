with
    source as (
        select 
         /* Primary Key*/ 
            supplier_id

            ,   company_name
            ,   contact_name
            ,   phone	

            ,   country
            ,   region        
            ,   city
            ,   address       
            ,   fax
            ,   postal_code
            ,   homepage

            /* stich comulns*/  
            ,   _sdc_received_at
            ,   _sdc_table_version
            ,   _sdc_sequence
            ,   contact_title
            ,   _sdc_batched_at	
             from {{source('northwind_etl2', 'suppliers')}}

    )


    select * from source