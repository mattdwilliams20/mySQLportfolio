-- subqueries used here. Finds total quantity of each ingredient, total cost of ingredients, 
-- calculated cost of ingredients, percentage stock remaining of each ingredient, and list of ingredients to reorder based on remaining stock
SELECT 
s1.item_name,
s1.ing_id,
s1.ing_name,
s1.ing_weight,
s1.ing_price,
s1.Order_Quantity,
s1.Recipe_Quantity,
s1.Order_Quantity * s1.Recipe_Quantity AS Ordered_Weight,
s1.ing_price / s1.ing_weight AS Unit_Cost,
(s1.Recipe_Quantity *s1.Order_Quantity) * (s1.ing_price / s1.ing_weight) AS Ingredient_Cost
FROM (SELECT 
o.item_id,
i.sku,
i.item_name,
r.ing_id,
ingr.ing_name,
r.quantity AS Recipe_Quantity,
SUM(o.quantity) AS Order_Quantity,
ingr.ing_weight,
ingr.ing_price
FROM orders o 
JOIN item i
ON o.item_id = i.item_id
JOIN recipe r
ON i.sku = r.recipe_id
JOIN ingredient ingr
ON ingr.ing_id = r.ing_id
GROUP BY o.item_id, i.sku, i.item_name, r.ing_id, r.quantity, ingr.ing_name, ingr.ing_weight, ingr.ing_price
ORDER BY item_id) s1