--Параметры

--NOCOUNT
DECLARE @I INT
SET NOCOUNT OFF -- ON/OFF
SELECT * FROM Warehouse.Colors
SET @I = @@ROWCOUNT --(41 rows affected)
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

--Получение существующих хранимы процедур
SELECT name AS [Procedure_Name]
     , SCHEMA_NAME(schema_id) AS [Schema_Name]
     , type_desc
     , create_date
     , modify_date
FROM sys.procedures;

--Выходные параметры курсора
DECLARE @MyCursor CURSOR;
EXEC dbo.uspCitiesCursor @CityCursor = @MyCursor OUTPUT;
WHILE (@@FETCH_STATUS = 0)
BEGIN
    FETCH NEXT FROM @MyCursor;
END;
CLOSE @MyCursor;
DEALLOCATE @MyCursor;