USE AutomotiveProcurementAnalytics;
GO

CREATE TABLE Suppliers (
    Supplier_ID VARCHAR(20) PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    Lead_Time_Days INT,
    Quality_Rating DECIMAL(3,1)
);

CREATE TABLE Materials (
    Material_ID VARCHAR(20) PRIMARY KEY,
    Material_Name VARCHAR(100),
    Category VARCHAR(50),
    Unit_Of_Measure VARCHAR(30)
);

CREATE TABLE Purchase_Orders (
    PO_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Supplier_ID VARCHAR(20),
    Material_ID VARCHAR(20),
    Quantity INT,
    Unit_Price DECIMAL(18,2),
    Total_Cost DECIMAL(18,2)
);

CREATE TABLE Deliveries (
    Delivery_ID VARCHAR(20) PRIMARY KEY,
    PO_ID VARCHAR(20),
    Promised_Date DATE,
    Delivery_Date DATE,
    Delay_Days INT
);