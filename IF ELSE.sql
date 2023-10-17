BEGIN
     DECLARE @num int = 10;

	 IF @num > 10
	 BEGIN
		 PRINT('Yes');
		 PRINT('Yes Yes !!');
	 END
	 ELSE
	     PRINT('The number is not greater than 10')
	 
END

-- nested if/else
BEGIN
     DECLARE @num2 INT;
	 SET @num2 = 11;

	 IF @num2 >= 10
	 BEGIN
		 PRINT('Yes');
		 
		 IF @num2 = 10
		    PRINT('The number is 10 ')
	 END
	 ELSE
	     PRINT('The number is not greater than 10')	 
END

/* Find person with business entity ID*/
BEGIN
     DECLARE @BID INT;
	 SET @BID = -21;

	 SELECT * FROM [Person].[Person]
	 WHERE BusinessEntityID = @BID

	 IF @@ROWCOUNT > 0
	 BEGIN
	     PRINT('Record of Person with Business Entity ID ' + CAST(@BID as VARCHAR) +' has been found');   
	 END
	 ELSE
	      PRINT('Record of Person with Business Entity ID ' + CAST(@BID as VARCHAR) +' has not been found');
END

