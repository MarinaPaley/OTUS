USE WideWorldImporters
IF OBJECT_ID(N'dbo.uspCitiesCursor', N'P') IS NOT NULL
DROP PROCEDURE dbo.uspCitiesCursor;
GO
CREATE PROCEDURE dbo.uspCitiesCursor
@CityCursor CURSOR VARYING OUTPUT
AS
    SET @CityCursor = CURSOR
    FORWARD_ONLY STATIC FOR
        SELECT CityID, CityName
        FROM [Application].Cities;
    OPEN @CityCursor;