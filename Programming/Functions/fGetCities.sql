USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fGetCities', N'IF') IS NOT NULL
    DROP FUNCTION dbo.fGetCities;
GO
CREATE FUNCTION dbo.fGetCities(@ProvinceID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT CityName
    FROM [Application].Cities
    WHERE StateProvinceID = @ProvinceID
);