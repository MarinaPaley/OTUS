USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fGetMaxOrder', N'FN') IS NOT NULL
DROP FUNCTION dbo.fGetMaxOrder;
GO
CREATE FUNCTION dbo.fGetMaxOrder()
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @Result DECIMAL(18, 2);
    SELECT @Result = 
    (SELECT TOP 1
        SUM(Quantity * UnitPrice) AS [Sum]
    FROM Sales.OrderLines
    GROUP BY OrderID
    ORDER BY [Sum] DESC)

    RETURN @Result;
END;