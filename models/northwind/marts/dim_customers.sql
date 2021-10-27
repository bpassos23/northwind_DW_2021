with
    selected as (
        select 
         /* Primary Key*/ 
            , customer_id
        		        
            , country  
            , city	
            , fax		
            , postal_code	
            , address	
            , region	
            , contact_name		
            , phone	
            , company_name	
            , contact_title
             from {{ref('stg_customers')}}

    )


    select * 
    from selected          