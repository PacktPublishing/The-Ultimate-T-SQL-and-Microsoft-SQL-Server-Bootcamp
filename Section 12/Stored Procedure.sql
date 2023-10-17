CREATE PROC sp_MaxMin @ID INT
AS
BEGIN     
    
	 PRINT('The max Person ID id:' + CAST(@ID as NVARCHAR));
	 
	 BEGIN
	     SELECT  @ID = MIN(BusinessEntityID) FROM [Person].[Person];
	     PRINT('The min Person ID id:' + CAST(@ID as NVARCHAR));
	 END
END


EXEC sp_MaxMin  @ID = 100
EXEC sp_MaxMin  100
GO

ALTER PROC sp_MaxMin @ID INT
AS
BEGIN     
    
	 PRINT('The Person ID is:' + CAST(@ID as NVARCHAR));
	 
	 SELECT  *  FROM [Person].[Person] WHERE BusinessEntityID =@ID;	    
	
END
GO

--- Multiple Parameters
ALTER PROC sp_person @ID INT, @PT VARCHAR(5)
AS
BEGIN
     SELECT  *  FROM [Person].[Person] WHERE BusinessEntityID > @ID and PersonType = @PT;

	 IF @@ROWCOUNT = 0
	    PRINT('NO RECORD FOUND');
END
GO

EXEC sp_person 200, 'EM'
GO

--input parameter
CREATE PROC sp_FindMaxPerson (@max INT OUTPUT)
AS
BEGIN
     SELECT MAX(BusinessEntityID) FROM
	 Person.Person
END
GO

DECLARE @max INT

EXEC sp_FindMaxPerson @max OUTPUT

PRINT(@max)


