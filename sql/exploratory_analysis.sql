--Row counts
SELECT COUNT(*) FROM Suppliers;
SELECT COUNT(*) FROM Materials;

--Top 10 rows
SELECT TOP 10 * FROM Purchase_Orders;

--Date range
SELECT MIN(Order_Date), MAX(Order_Date)
FROM Purchase_Orders;