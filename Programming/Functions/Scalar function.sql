USE WideWorldImporters;

-- Найдем сумму каждого заказа:
SELECT SUM(Quantity * UnitPrice) AS [Sum]
     , OrderID
FROM Sales.OrderLines
GROUP BY OrderID
ORDER BY [Sum] desc;

--Найдем сумму (значение) максимального заказа:
SELECT dbo.fGetMaxOrder() AS MaxOrder;

--Найдем сумму (значение) для выбранного заказа:
DECLARE @OrderID INT = 4757;
SELECT dbo.fGetSumOrder(@OrderID) AS [SUM]
     , @OrderID AS [OrderID];

-- Найдем ID, зная название провинции
DECLARE @StateProvince NVARCHAR(50) = N'Arkansas';
SELECT dbo.fGetProvinceId(@StateProvince) AS ProvinceID;

--Найдем ID города, зная название города и название провинции

DECLARE @Province NVARCHAR(50) = N'Minnesota';
DECLARE @City NVARCHAR(50) = N'Bock';
SELECT dbo.fGetCityId(@City, @Province) AS CityID;

--Найти среднюю цену продуктов для заданного размера
DECLARE @Size NVARCHAR(20) = N'XL';
SELECT dbo.fGetAveragePrice(@Size) AS AveragePrice;
