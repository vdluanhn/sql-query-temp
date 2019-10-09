INSERT INTO [TESTLINKDATA].[PartitionTest].[dbo].[Users]
           (
           [name]
           ,[created_date]
           ,[birthday]
           ,[user_name]
           ,[password]
           ,[status]
           ,[sex])
  select  [name]
           ,[created_date]
           ,[birthday]
           ,[user_name]
           ,[password]
           ,[status]
           ,[sex] from [dbo].Users where   created_date >= '2000-01-01 00:00:00' and created_date < '2019-01-01 00:00:00' 
GO


