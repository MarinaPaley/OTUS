USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fGetAllInvoicesForCityID_CROSS_APPLY', N'IF') IS NOT NULL
    DROP FUNCTION dbo.fGetAllInvoicesForCityID_CROSS_APPLY;
GO
CREATE FUNCTION dbo.fGetAllInvoicesForCityID_CROSS_APPLY(@DeliveryCityID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT c.CustomerName [Customer]
         , i.SalespersonPersonID [SalesPerson]
         , l.[Description]
    FROM Sales.Customers c
    CROSS APPLY (SELECT *
    FROM Sales.Invoices i
    WHERE c.CustomerID = i.CustomerID) AS i
    CROSS APPLY (SELECT *
    FROM Sales.InvoiceLines l
    WHERE l.InvoiceID = i.InvoiceID
    AND DeliveryCityID = @DeliveryCityID) AS l
);