USE WideWorldImporters;

SELECT c.CustomerName [Customer]
     , i.SalespersonPersonID [SalesPerson]
     , l.[Description]
FROM Sales.Customers c
INNER JOIN Sales.Invoices i
    ON c.CustomerID = i.CustomerID
INNER JOIN Sales.InvoiceLines l
    ON l.InvoiceID = i.InvoiceID
WHERE DeliveryCityID = 3425;

--Показать покупателя, продавца и описание товара для города DeliveryCityID
DECLARE @DeliveryCityID INT = 3425;
SELECT * FROM dbo.fGetAllInvoicesForCityID(@DeliveryCityID);

--Показать покупателя, продавца и описание товара для города N из провинции P
DECLARE @Province NVARCHAR(50) = N'Minnesota';
DECLARE @City NVARCHAR(50) = N'Bock';
--Через предыдущую функцию:
SELECT * FROM dbo.fGetAllInvoicesForCityID
(dbo.fGetCityId(@City, @Province));
--Ипользуя новую функцию:
SELECT * FROM dbo.fGetAllInvoicesForCity(@City, @Province);