USE [PartTest]
GO


declare @dateEnd datetime = '2019-01-01 00:01:30', @dateStart datetime = '2010-01-01 00:01:35.000', @birthday datetime = '1960-01-01'
DECLARE @FromDate DATETIME2(0)
DECLARE @ToDate   DATETIME2(0)

SET @FromDate = '1959-01-01 23:22:13' 
SET @ToDate = '2008-03-05 00:56:31'


declare @inc int = 1, @i int = 0, @m int = 0
while @dateStart < @dateEnd
begin
set @i = @i+1;
set @m = @m+1
set @dateStart = DATEADD(MINUTE,@inc,@dateStart)

DECLARE @Seconds INT = DATEDIFF(SECOND, @FromDate, @ToDate)
DECLARE @Random INT = ROUND(((@Seconds-1) * RAND()), 0)

SELECT @birthday =  DATEADD(SECOND, @Random, @FromDate)
INSERT INTO [dbo].[Users]
           ([name]
           ,[created_date]
           ,[birthday]
           ,[user_name]
           ,[password]
           ,[status]
           ,[sex])
     VALUES
           (concat(N'Đinh Đức Dũng ',@i)
           ,@dateStart
           ,@birthday
           ,concat('dungdd',@i)
           ,'123'
           , FLOOR(RAND()*(1-0+1)+0)
           , FLOOR(RAND()*(1-0+1)+0));


end

print concat('Tong da insert: ',@m, ' ban ghi')

GO


