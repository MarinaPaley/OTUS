IF OBJECT_ID (N'dbo.fGetAllInvoicesForCityID', N'IF') IS NOT NULL
    DROP FUNCTION dbo.fGetAllInvoicesForCityID;
GO
CREATE FUNCTION dbo.fGetAllInvoicesForCityID(@DeliveryCityID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT c.CustomerName [Customer]
         , i.SalespersonPersonID [SalesPerson]
         , l.[Description]
    FROM Sales.Customers c
    INNER JOIN Sales.Invoices i
        ON c.CustomerID = i.CustomerID
    INNER JOIN Sales.InvoiceLines l
        ON l.InvoiceID = i.InvoiceID
    WHERE DeliveryCityID = @DeliveryCityID
);