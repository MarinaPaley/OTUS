USE Example;
DROP TABLE CursorTest;
CREATE TABLE CursorTest
(
   CursorTestID  INT IDENTITY(1,1) PRIMARY KEY CLUSTERED, -- Column Names
   Filler        VARCHAR(4000), -- Data Types
   RunningTotal  BIGINT 
)
GO 
INSERT INTO dbo.CursorTest ( Filler, RunningTotal )
VALUES ( REPLICATE('a', 4000),  0  )
GO 100
------------------------
SELECT *
FROM dbo.CursorTest;
-----------------------
--cursor approch
----------------------
DECLARE @CursorTestID INT;
DECLARE @RunningTotal BIGINT = 0;
 
DECLARE CUR_TEST CURSOR FAST_FORWARD FOR
    SELECT CursorTestID RunningTotal
    FROM   CursorTest
    ORDER BY CursorTestID;
 
OPEN CUR_TEST
FETCH NEXT FROM CUR_TEST INTO @CursorTestID
 
WHILE @@FETCH_STATUS = 0
BEGIN
   UPDATE dbo.CursorTest 
   SET RunningTotal = @RunningTotal + @CursorTestID
   WHERE CursorTestID = @CursorTestID;
   SET @RunningTotal += @CursorTestID
   FETCH NEXT FROM CUR_TEST INTO @CursorTestID
END
CLOSE CUR_TEST
DEALLOCATE CUR_TEST
GO

---------------------
--loop approch
---------------------
UPDATE dbo.CursorTest
SET RunningTotal = NULL;

DECLARE @CursorTestID INT = 1;
DECLARE @RunningTotal BIGINT = 0;
DECLARE @RowCnt BIGINT = 0;
-- Get a count of total rows to process with a SELECT COUNT statement
SELECT @RowCnt = COUNT(0) FROM dbo.CursorTest;
 
WHILE @CursorTestID <= @RowCnt
BEGIN
   UPDATE dbo.CursorTest 
   SET RunningTotal = @RunningTotal  + @CursorTestID
   WHERE CursorTestID = @CursorTestID;
   SET @RunningTotal += @CursorTestID
    
   SET @CursorTestID = @CursorTestID + 1 
 
END

-----------------