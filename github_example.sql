select created_date,
--        customer_email,
     sum(gross_sales) as gross,
     sum(discount) as discount_amount,
     sum(gross_sales + discount + shipping) as net,
     sum(rug_quantity) as rugs_sold,
     count(distinct order_name) as orders
from shopify_ruggable.mv_ruggable_shopify_orders_detailed
where cancelled is false
    and order_source_name in ('web', '3890849', '580111', 'iphone', '1421854')
    and (product_type in ('Rug','Doormat') or variant_group in ('System','Cover','Rug Pad'))
    and customer_id in (
        select distinct customer_id
        from shopify_ruggable.mv_ruggable_shopify_orders_detailed
        where product_group = 'AS21 RUGGABLE X JONATHAN ADLER'
    )
group by 1 ;

-- here's a note for the second commit