IF OBJECT_ID (N'dbo.fGetCityIDByName', N'FN') IS NOT NULL
    DROP FUNCTION dbo.fGetCityIDByName;
GO
CREATE FUNCTION dbo.fGetCityIDByName(@DeliveryCity NVARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @DeliveryCityID INT = 
    (SELECT CityID 
    FROM [Application].Cities
    WHERE CityName LIKE @DeliveryCity);

    RETURN @DeliveryCityID;
END;