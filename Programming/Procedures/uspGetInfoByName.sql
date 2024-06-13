USE WideWorldImporters;
IF OBJECT_ID(N'[Application].uspGetInfoByName', N'P') IS NOT NULL
DROP PROCEDURE [Application].uspGetInfoByName;
GO
CREATE PROCEDURE [Application].uspGetInfoByName(@FullName NVARCHAR(50))
AS
    SET NOCOUNT ON;

    SELECT *
    FROM [Application].People
    WHERE FullName LIKE @FullName;
