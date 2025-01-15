USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fGetSumOrder', N'FN') IS NOT NULL
DROP FUNCTION dbo.fGetSumOrder;
GO
CREATE FUNCTION dbo.fGetSumOrder(@OrderID INT)
RETURNS DECIMAL (18, 2)
AS
BEGIN
    DECLARE @Result DECIMAL (18, 2);
    SELECT @Result = 
        (SELECT SUM(Quantity * UnitPrice) AS [Sum]
        FROM Sales.OrderLines
        WHERE OrderID = @OrderID)

    RETURN @Result;
END;