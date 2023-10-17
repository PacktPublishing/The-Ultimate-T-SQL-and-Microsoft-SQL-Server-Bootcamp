/****** Script for SelectTopNRows command from SSMS  ******/
LEAD(Column_Name, Offset, Default_Value) OVER (ORDER BY Col1, Col2, ...)
LAG(Column_Name, Offset, Default_Value) OVER (ORDER BY Col1, Col2, ...)

SELECT ProductID,Name,ProductNumber, SafetyStockLevel,
LEAD(SafetyStockLevel,5,0) OVER (ORDER BY ProductID) as NextStockLevel,
LAG(SafetyStockLevel,5,0) OVER (ORDER BY ProductID) as PrevStockLevel
FROM [Production].[Product]

