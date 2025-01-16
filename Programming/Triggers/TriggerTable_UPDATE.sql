DROP TABLE TriggerTable;
DROP TABLE TriggerTableLog;

CREATE TABLE TriggerTable([Name] VARCHAR(50));
CREATE TABLE TriggerTableLog ([Name] VARCHAR(50));

CREATE TRIGGER TriggerTable_UPDATE
ON TriggerTable
AFTER UPDATE
AS
    INSERT INTO TriggerTableLog([Name])
    SELECT [Name]
    FROM INSERTED;

--Вставляем тестовое значение 
INSERT INTO TriggerTable([Name])
VALUES ('test1');

UPDATE TriggerTable
SET [Name] = 'test2';

SELECT * FROM TriggerTable;
SELECT * FROM TriggerTableLog;

DROP TRIGGER TriggerTable_UPDATE;
DROP TABLE TriggerTableLog;
DROP TABLE TriggerTable;