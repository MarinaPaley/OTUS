USE WideWorldImporters;
IF OBJECT_ID(N'[Application].uspGetPeople', N'P') IS NOT NULL
DROP PROCEDURE [Application].uspGetPeople;
GO
CREATE PROCEDURE [Application].uspGetPeople
AS
    SET NOCOUNT ON;
    SELECT *
    FROM [Application].People;
