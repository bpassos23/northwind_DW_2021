with
    source_data as (
        select 
         /* Primary Key*/ 
         ,   product_id	

         /*Foreign Key*/
          ,   category_id
          ,  supplier_id	

          ,  units_in_stock		
          ,  unit_price	
          ,  units_on_order		          
          ,  reorder_level		
          ,  product_name	
          ,  quantity_per_unit
          ,  discontinued	          		

            /* stich comulns*/  
          ,  _sdc_received_at	                   
          ,  _sdc_sequence	          
          ,  _sdc_table_version	          
          ,  _sdc_batched_at	

             from {{source('northwind_etl2', 'products')}}

    )


    select * from source