--Average delay
SELECT
AVG(CAST(Delay_Days AS DECIMAL(10,2))) AS Avg_Delay_days
FROM Deliveries

--On time delivery%
SELECT
	CAST(
		100.0 * SUM(CASE WHEN Delay_Days <= 0 THEN 1 ELSE 0 END)
		/ COUNT(*)
	AS DECIMAL(5,2))
	AS On_Time_Delivery_Percentage
FROM Deliveries


--Supplier rankings


--Top 5 most expensive materials
SELECT TOP 5 Material_Name, Unit_Price
FROM Materials
JOIN Purchase_Orders
ON Materials.Material_ID = Purchase_Orders.Material_ID
ORDER BY Unit_Price DESC

--Top 10 purchase orders by value
SELECT TOP 10 PO_ID, Total_Cost 
FROM Purchase_Orders
ORDER BY Total_cost Desc