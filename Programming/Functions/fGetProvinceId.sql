USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fGetProvinceId', N'FN') IS NOT NULL
DROP FUNCTION dbo.fGetProvinceId;
GO
CREATE FUNCTION dbo.fGetProvinceId(
    @StateProvince NVARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @Result INT;
    SELECT @Result = 
    (SELECT StateProvinceID 
    FROM [Application].StateProvinces
    WHERE StateProvinceName LIKE @StateProvince);

    IF (@Result IS NULL)
        SET @Result = 0

    RETURN @Result;
END;