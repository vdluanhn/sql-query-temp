--select STAFF_FULL_NAME+'-'+ STAFF_TYPE as FullName from STAFF
go
SELECT STUFF((select ', ' + STAFF_FULL_NAME
              FROM dbo.STAFF
              for xml path ('')
             ), 1, 2, '') AS fullname