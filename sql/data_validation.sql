-- Duplicate Purchase Orders
SELECT
PO_ID,
COUNT(*)
FROM Purchase_Orders
GROUP BY PO_ID
HAVING COUNT(*) > 1;


-- Duplicate Suppliers
SELECT
Supplier_ID,
COUNT(*)
FROM Suppliers
GROUP BY Supplier_ID
HAVING COUNT(*) > 1;