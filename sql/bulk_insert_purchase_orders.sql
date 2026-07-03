BULK INSERT dbo.Purchase_Orders
FROM 'C:\Users\91729\Desktop\Madhu\Git projects\automotive-procurement-spend-analytics\data\raw\purchase_orders.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);