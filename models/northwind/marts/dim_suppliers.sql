with
    selected as (
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
             from {{ref('stg_suppliers')}}

    )

         select * 
    from selected