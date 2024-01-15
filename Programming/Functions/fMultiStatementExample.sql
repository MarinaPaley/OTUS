USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fMultyStatementExample', N'TF') IS NOT NULL
    DROP FUNCTION dbo.fMultyStatementExample;
GO
CREATE FUNCTION dbo.fMultyStatementExample(@Size NVARCHAR(20))
RETURNS @TableExample TABLE
(
    StockItemID INT
  , Brand NVARCHAR(50)
  , Color NVARCHAR(20)
  , UnitPrice DECIMAL(18, 2)
)
AS
BEGIN
    DECLARE @AVG DECIMAL(18, 2);
    SET @AVG = dbo.fGetAveragePrice(@Size);

    INSERT INTO @TableExample
    SELECT s.StockItemID
         , s.Brand
         , c.ColorName AS Color
         , s.UnitPrice
    FROM Warehouse.StockItems s
    INNER JOIN Warehouse.Colors c
        ON c.ColorID = s.ColorID
    WHERE Size LIKE @Size AND UnitPrice > @AVG;

    RETURN
END;