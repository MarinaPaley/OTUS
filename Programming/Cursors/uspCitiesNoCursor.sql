USE WideWorldImporters
IF OBJECT_ID(N'dbo.uspCitiesNoCursor', N'P') IS NOT NULL
DROP PROCEDURE dbo.uspCitiesNoCursor;
GO
CREATE PROCEDURE dbo.uspCitiesNoCursor
  @number INT
, @CityID INT OUTPUT
, @CityName VARCHAR(50) OUTPUT
AS
WITH temp AS 
	(
		SELECT ROW_NUMBER() OVER (ORDER BY CityID ASC) AS N
		, *
		FROM [Application].Cities
	)
SELECT @CityID = temp.CityID, @CityName = temp.CityName
FROM temp
WHERE temp.N = @number;

DECLARE @ID INT = 0;
DECLARE @name VARCHAR(50) = NULL;
DECLARE @count INT = 0;
DECLARE @current_number INT = 1;
SELECT  @count = 10 --COUNT(*) FROM [Application].Cities;

WHILE   @current_number <= @count
BEGIN
	EXEC dbo.uspCitiesNoCursor 
		@number = @current_number, 
		@CityID = @ID OUT, 
		@CityName = @name OUT
	SELECT @ID, @name;
	SET @current_number = @current_number + 1;
END;
