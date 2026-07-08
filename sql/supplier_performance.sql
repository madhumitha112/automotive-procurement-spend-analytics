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
-- KPI: Supplier Ranking by Total Procurement Spend
SELECT RANK() OVER (ORDER BY SUM(p.Total_Cost) DESC) AS Supplier_Rank,
s.Supplier_ID, s.Supplier_Name, SUM(p.Total_Cost) AS Total_Spend
FROM Purchase_Orders p
JOIN Suppliers s 
ON s.Supplier_ID = p.Supplier_ID
GROUP BY
	s.Supplier_ID,
	s.Supplier_Name
ORDER BY Supplier_Rank

--Top 5 most expensive materials
SELECT TOP 5
    m.Material_Name,
    AVG(p.Unit_Price) AS Average_Price
FROM Purchase_Orders p
JOIN Materials m
ON p.Material_ID = m.Material_ID
GROUP BY
    m.Material_ID,
    m.Material_Name
ORDER BY Average_Price DESC;

--Top 10 purchase orders by value
SELECT TOP 10 PO_ID, Total_Cost 
FROM Purchase_Orders
ORDER BY Total_cost Desc