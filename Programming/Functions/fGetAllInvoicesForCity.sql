USE WideWorldImporters;
IF OBJECT_ID (N'dbo.fGetAllInvoicesForCity', N'IF') IS NOT NULL
    DROP FUNCTION dbo.fGetAllInvoicesForCity;
GO
CREATE FUNCTION dbo.fGetAllInvoicesForCity(
    @DeliveryCity NVARCHAR(50),
    @StateProvince NVARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM dbo.fGetAllInvoicesForCityID
    (dbo.fGetCityId(@DeliveryCity, @StateProvince))
);