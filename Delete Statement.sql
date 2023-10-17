--Syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

SELECT * FROM [Person].[Person]

--update all rows in a column 
UPDATE [Person].[Person]
SET EmailPromotion = 1

--Update a single record
UPDATE [Person].[Person]
SET Title = 'Mr.'
WHERE BusinessEntityID = 4

-- update multiple colums
UPDATE [Person].[Person]
SET Title = 'Mr.', MiddleName = 'B'
WHERE BusinessEntityID = 10

--Update using join
SELECT P.FirstName, P.LastName, A.AddressLine1, A.City, P.EmailPromotion
FROM  [Person].[Person] P
INNER JOIN [Person].[BusinessEntityAddress] BE ON P.BusinessEntityID = BE.BusinessEntityID
INNER JOIN [Person].[Address] A ON BE.AddressID = A.AddressID
WHERE A.City = 'Bothell'

UPDATE [Person].[Person] SET EmailPromotion = 2
FROM  [Person].[Person]  P
INNER JOIN [Person].[BusinessEntityAddress] BE ON P.BusinessEntityID = BE.BusinessEntityID
INNER JOIN [Person].[Address] A ON BE.AddressID = A.AddressID
WHERE A.City = 'Bothell'

SELECT * FROM [Sales].[SalesPerson]
SELECT * FROM [Sales].[SalesTerritory]
--Update sales person from US region

 SELECT [BusinessEntityID],[Bonus],[CommissionPct]
 FROM [Sales].[SalesPerson] SP
 INNER JOIN [Sales].[SalesTerritory] ST ON SP.TerritoryID = ST.TerritoryID
 WHERE CountryRegionCode = 'US'

--Update Using Join Statements
 UPDATE [Sales].[SalesPerson]
 SET Bonus += Bonus * 0.5
 FROM [Sales].[SalesPerson] SP
 INNER JOIN [Sales].[SalesTerritory] ST ON SP.TerritoryID = ST.TerritoryID
 WHERE CountryRegionCode = 'US'

 --Decrease bonus using CTE
 WITH CTE 
 AS
 (
    SELECT [BusinessEntityID],[Bonus],[CommissionPct]
    FROM [Sales].[SalesPerson] SP
    INNER JOIN [Sales].[SalesTerritory] ST ON SP.TerritoryID = ST.TerritoryID
    WHERE CountryRegionCode = 'US'
 )
 UPDATE CTE SET  Bonus -= Bonus * 0.75