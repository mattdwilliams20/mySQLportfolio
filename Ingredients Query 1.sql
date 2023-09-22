-- Calculating total inventory weight ordered, and total weight remaining by subtracting weight already ordered
SELECT 
ing.ing_id, 
s2.ing_name, 
s2.Ordered_Weight, 
inv.quantity,
inv.quantity * ing.ing_weight AS Total_Inventory_Weight,
(inv.quantity * ing.ing_weight) - s2.Ordered_Weight AS Remaining_Weight
FROM 
(SELECT ing_id,
ing_name, 
SUM(Ordered_Weight) AS Ordered_Weight
FROM stock1
GROUP BY ing_name, ing_id) s2

JOIN inventory inv
ON inv.item_id = s2.ing_id
JOIN ingredient ing
ON ing.ing_id = s2.ing_id;
