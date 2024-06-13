USE WideWorldImporters;
IF OBJECT_ID(N'[Application].uspGetInfoCALLER', N'P') IS NOT NULL
DROP PROCEDURE [Application].uspGetInfoCALLER;
GO
CREATE PROCEDURE [Application].uspGetInfoCALLER(@FullName NVARCHAR(50))
WITH EXECUTE AS CALLER
AS
    SET NOCOUNT ON;

    SELECT *
    FROM [Application].People
    WHERE FullName LIKE @FullName;
