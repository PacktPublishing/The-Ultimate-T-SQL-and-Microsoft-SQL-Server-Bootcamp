--using subquery
SELECT SalesOrderID,CarrierTrackingNumber, OrderQty,
	   (SELECT MAX(UnitPrice) FROM [Sales].[SalesOrderDetail]) AS UnitPrice,
	   (SELECT MIN(UnitPrice) FROM [Sales].[SalesOrderDetail]) AS UnitPrice	
FROM [Sales].[SalesOrderDetail]

-- using OVER
SELECT SalesOrderID,CarrierTrackingNumber, OrderQty,
	MAX(UnitPrice) OVER() AS MaxUnitPrice,
	MIN(UnitPrice) OVER() AS MinUnitPrice	
FROM [Sales].[SalesOrderDetail]

--partitioning the data
SELECT SalesOrderID,CarrierTrackingNumber, OrderQty,
	MAX(UnitPrice) OVER(PARTITION BY SalesOrderID) AS MaxUnitPrice,	
	MIN(UnitPrice) OVER(PARTITION BY SalesOrderID) AS MinUnitPrice
FROM [Sales].[SalesOrderDetail]

--sum by sales order
SELECT SalesOrderID,CarrierTrackingNumber, OrderQty,
	SUM(UnitPrice) OVER(PARTITION BY SalesOrderID) AS Total	
FROM [Sales].[SalesOrderDetail]
