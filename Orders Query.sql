USE pizza_db;
SELECT 
o.row_id,
o.order_id,
i.item_price, 
o.quantity, 
i.item_cat, 
i.item_name, 
o.created_at,
a.delivery_address1, 
a.delivery_address2,
a.delivery_city,
a.delivery_zipcode  
FROM orders o 
JOIN item i
USING (item_id)
JOIN address a
USING (add_id)
ORDER BY o.row_id;