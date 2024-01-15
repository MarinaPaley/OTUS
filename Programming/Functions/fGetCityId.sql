USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fGetCityId', N'FN') IS NOT NULL
DROP FUNCTION dbo.fGetCityId;
GO
CREATE FUNCTION dbo.fGetCityId(
    @DeliveryCity NVARCHAR(50),
    @StateProvince NVARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @StateProvinceId INT;
    SELECT @StateProvinceId = 
    (SELECT dbo.fGetProvinceId(@StateProvince));
    IF (@StateProvinceId IS NULL)
        RETURN 0;

    DECLARE @Result INT;
    SELECT @Result = 
    (SELECT CityID 
    FROM [Application].Cities
    WHERE CityName LIKE @DeliveryCity
    AND StateProvinceID = @StateProvinceId);

    IF (@Result IS NULL)
        SET @Result = 0

    RETURN @Result;
END;