--Multi-statement table-valued function
--Показать данные по продуктам для размера Size, у которых цена выше средней цены
DECLARE @Size NVARCHAR(20) = N'XL';

SELECT s.StockItemID
     , s.Brand
     , c.ColorName AS Color
     , s.UnitPrice
FROM Warehouse.StockItems s
INNER JOIN Warehouse.Colors c
    ON c.ColorID = s.ColorID
WHERE Size LIKE @Size;

--Напишем функцию для такого сценрия
DECLARE @Size NVARCHAR(20) = N'XL';
SELECT * FROM dbo.fMultyStatementExample(@Size);