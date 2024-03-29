SELECT SERVERPROPERTY('IsFullTextInstalled') --check db co cai dat cho phep tim kiem fulltext hay khong. 0 - chua cai; 1 - da cai
go
--hàm phan trang
CREATE PROCEDURE [dbo].[spPhanTrang_Table] (
 @PageNumber int,
 @PageSize int
)

AS
 DECLARE @Start int, @End int
 BEGIN TRANSACTION GetDataSet
 SET @Start = (((@PageNumber - 1) * @PageSize) + 1)
 IF @@ERROR <> 0
  GOTO ErrorHandler
 SET @End = (@Start + @PageSize - 1)
 IF @@ERROR <> 0
  GOTO ErrorHandler
 CREATE TABLE #TemporaryTable (
  Row int IDENTITY(1,1) PRIMARY KEY,
  CateID int, CateName nvarchar(100)
 )
 IF @@ERROR <> 0
   GOTO ErrorHandler
 INSERT INTO #TemporaryTable
  SELECT CateID, CateName FROM [TB_Category] 
 IF @@ERROR <> 0
  GOTO ErrorHandler
 SELECT CateID, CateName  
  FROM #TemporaryTable
  WHERE (Row >= @Start) AND (Row <= @End)
 IF @@ERROR <> 0
  GOTO ErrorHandler
 DROP TABLE #TemporaryTable
 COMMIT TRANSACTION GetDataSet
 RETURN 0
ErrorHandler:
ROLLBACK TRANSACTION GetDataSet
RETURN @@ERROR