with
    selected as (
        select 
         /* Primary Key*/ 
            product_id	
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
             from {{ref('stg_products')}}

    )

         select * 
    from selected