BULK INSERT dbo.Suppliers
FROM 'C:\Users\91729\Desktop\Madhu\Git projects\automotive-procurement-spend-analytics\data\raw\suppliers.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);