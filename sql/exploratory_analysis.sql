--Row counts
SELECT COUNT(*) FROM Suppliers;
SELECT COUNT(*) FROM Materials;

--Top 10 rows
SELECT TOP 10 * FROM Purchase_Orders;

--Date range
SELECT MIN(Order_Date), MAX(Order_Date)
FROM Purchase_Orders;

--Count of Purchase orders
SELECT COUNT(*) AS Purchase_Order_Count
FROM Purchase_Orders;

--Count of Deliveries
SELECT COUNT(*) AS Delivery_Count
FROM Deliveries;

--Missing value check
SELECT *
FROM Purchase_Orders
WHERE Supplier_ID IS NULL
   OR Material_ID IS NULL;