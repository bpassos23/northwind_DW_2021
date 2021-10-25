with
    source as (
        select 
         /* Primary Key*/ 
            , customer_id
        		        
            , country  
            , address	            
            , city	
            , fax		
            , postal_code	

            , region	
            , contact_name		
            , phone	
            , company_name	
            , contact_title
            /* stich comulns*/
            , _sdc_sequence            
            , _sdc_received_at            
            , _sdc_table_version	
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            from {{source('northwind_etl2', 'customers')}}

    )


    select * from source