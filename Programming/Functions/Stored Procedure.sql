--Параметры
--QUOTED_IDENTIFIER ON (ANSI Standard)
--SELECT "Hello world!" -- Error
SELECT 'Hello world!' -- OK
SELECT *
FROM "Application".Cities; -- OK

--NOCOUNT
DECLARE @I INT
SET NOCOUNT OFF -- ON/OFF
SELECT * FROM Warehouse.Colors
SET @I = @@ROWCOUNT --(36 rows affected)
PRINT @I;

EXECUTE [Application].uspGetPeople;
--Или
EXEC [Application].uspGetPeople;

EXEC [Application].uspGetInfoByName N'Eva Muirden'; --позиционная передача параметра
DECLARE @Name NVARCHAR(50) = N'Eva Muirden';
EXEC [Application].uspGetInfoByName @Name;

--Создаем процедуру с привелегими AS CALLER

DECLARE @Name NVARCHAR(50) = N'Eva Muirden';
EXEC [Application].uspGetInfoCALLER @Name;
