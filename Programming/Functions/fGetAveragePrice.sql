USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fGetAveragePrice', N'FN') IS NOT NULL
DROP FUNCTION dbo.fGetAveragePrice;
GO
CREATE FUNCTION dbo.fGetAveragePrice(@Size NVARCHAR(20))
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @AVG DECIMAL(18, 2);
    SELECT @AVG = 
    (
        SELECT AVG(UnitPrice)
        FROM Warehouse.StockItems
        WHERE UnitPrice > 0 AND Size LIKE @Size
    )

    RETURN @AVG;
END;