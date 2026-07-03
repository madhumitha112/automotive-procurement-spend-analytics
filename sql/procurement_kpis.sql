-- Total procurement spend
SELECT SUM(Total_Cost) AS Total_Spend
FROM Purchase_Orders

--Number of purchase orders

--Number of Suppliers used

--Spend by supplier
SELECT s.Supplier_Name, SUM(p.Total_Cost) AS Supplier_Spend
FROM Purchase_Orders p
JOIN Suppliers s
ON s.Supplier_ID = p.Supplier_ID
GROUP BY s.Supplier_Name
ORDER BY Supplier_Spend DESC

--Spend by category
SELECT m.Category, SUM(p.Total_Cost) AS Category_Spend
FROM Purchase_Orders p
JOIN Materials m
ON m.Material_ID = p.Material_ID
GROUP BY m.Category
ORDER BY Category_Spend DESC

--Monthly spend trend
SELECT 
YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
SUM(Total_Cost) AS Monthly_Spend_Trend
FROM Purchase_Orders
GROUP BY 
YEAR(Order_Date), MONTH(Order_Date)
ORDER BY YEAR, MONTH