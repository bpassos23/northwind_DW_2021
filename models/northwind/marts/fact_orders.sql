with    
customers as (
    select *
    from {{ ref('dim_customers')}}
)

 , shippers as (
    select * 
    from {{ref ('dim_shippers')}}

)
 , suppliers as (
    select * 
    from {{ref ('dim_suppliers')}}
)

,orders_with_sk as (
    select
         orders.order_id
        ,customers.customer_sk as customer_fk
        ,orders.employee_id       
        ,orders.ship_address
        ,orders.required_date
        ,orders.order_date	
        ,orders.ship_name	
        ,orders.ship_region		
        ,orders.shipped_date		
        ,orders.ship_country	
        ,orders.ship_postal_code	
        ,orders.ship_city
        ,orders.freight
        ,orders.ship_via
    from {{ref('stg_orders')}} as orders  
    left join customers  on orders.customer_id = customers.customer_id   
    ) 

   , products_with_sk as (
     select 
            products.product_id	
          ,  products.category_id
          ,  suppliers.supplier_id	as supplier_sk

          ,  products.units_in_stock		
          ,  products.unit_price	
          ,  products.units_on_order		          
          ,  products.reorder_level		
          ,  products.product_name	
          ,  products.quantity_per_unit
          ,  products.discontinued	     

     from{{ref('dim_products')}} as products  
     left join suppliers on products.supplier_id = suppliers.supplier_id 
     )

    ,order_details_with_sk as (
        select
            products_with_sk.product_id as product_fk
            ,order_details.order_id             
            ,order_details.discount	
            ,order_details.unit_price	
            ,order_details.quantity
                from {{ref('stg_order_details')}} as order_details
            left join products_with_sk on order_details.product_id = products_with_sk.product_id    
    )
, final as (
    select
        order_details_with_sk.order_id
        ,order_details_with_sk.product_fk
        ,orders_with_sk.customer_fk
        ,orders_with_sk.ship_address
        ,orders_with_sk.required_date
        ,orders_with_sk.order_date	
        ,orders_with_sk.ship_name	
        ,orders_with_sk.ship_region		
        ,orders_with_sk.shipped_date		
        ,orders_with_sk.ship_country	
        ,orders_with_sk.ship_postal_code	
        ,orders_with_sk.ship_city
        ,orders_with_sk.freight
        ,orders_with_sk.ship_via
        from orders_with_sk
        left join order_details_with_sk on orders_with_sk.order_id = order_details_with_sk.order_id
)

select * from final