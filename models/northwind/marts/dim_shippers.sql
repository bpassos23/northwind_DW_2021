with
    selected as (
        select 
         /* Primary Key*/ 
            shipper_id	

            ,company_name
            ,phone	
            /* stich comulns*/  
            ,_sdc_sequence	
            ,_sdc_table_version	
            ,_sdc_received_at	
            ,_sdc_batched_at	         	
             from {{ref('stg_shippers')}}

    )

         select * 
    from selected