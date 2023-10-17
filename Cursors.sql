/****** Script for SelectTopNRows command from SSMS  ******/
DECLARE productsCR CURSOR STATIC  
    FOR 
	SELECT TOP(10)
	   [ProductID]
	  ,[Name]
      ,[ProductNumber]      
      ,[Color]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[StandardCost]
      ,[ListPrice]  
	FROM [Production].[Product]
OPEN productsCR  
FETCH NEXT FROM productsCR
--FETCH PRIOR FROM productsCR;
--FETCH LAST FROM productsCR;
CLOSE productsCR;
DEALLOCATE productsCR;


-- SELECT @@FETCH_STATUS
-- SELECT @@CURSOR_ROWS


SET NOCOUNT ON
-- Declaring the Variables 
DECLARE @ProductID INT
DECLARE @ProductName VARCHAR(50)
DECLARE @Color VARCHAR(50)
DECLARE	@ListPrice DECIMAL (10, 2)

DECLARE productsCR CURSOR 
STATIC FOR 
 SELECT TOP (50) 
       [ProductID]
      ,[Name]       
      ,[Color]      
      ,[ListPrice] 
 FROM [Production].[Product]

OPEN productsCR
IF @@CURSOR_ROWS > 0
BEGIN 
	 FETCH NEXT FROM productsCR  INTO @ProductID, @ProductName, @Color, @ListPrice       
	 WHILE @@FETCH_STATUS = 0
	 BEGIN
	 SELECT  @ProductID, @ProductName, @Color, @ListPrice --display 
	 PRINT( 'Product ID = '+ CONVERT(VARCHAR(10), @ProductID)+'Product Name = '+ @ProductName +', Color = '+ @Color  + ', List Price = ' + CONVERT(VARCHAR(10),@ListPrice))
 
	  FETCH NEXT FROM productsCR INTO @ProductID, @ProductName, @Color, @ListPrice   
	 END
END
CLOSE productsCR
DEALLOCATE productsCR
SET NOCOUNT OFF 