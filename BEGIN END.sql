BEGIN
     DECLARE @ID INT;
     SELECT  @ID = MAX(BusinessEntityID) FROM [Person].[Person];
	 PRINT('The max Person ID id:' + CAST(@ID as NVARCHAR));
	 
	 BEGIN
	     SELECT  @ID = MIN(BusinessEntityID) FROM [Person].[Person];
	     PRINT('The min Person ID id:' + CAST(@ID as NVARCHAR));
	 END
END

