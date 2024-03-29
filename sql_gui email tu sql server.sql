/****** Script for SelectTopNRows command from SSMS  ******/
SELECT count(1)
  FROM [DBTEST].[dbo].[TRANSACTION]

  go
  
CREATE UNIQUE CLUSTERED INDEX PK_TRANSACTION1 ON [DBTEST].[dbo].[TRANSACTION](TRANSACTION_ID) 
go
CREATE UNIQUE CLUSTERED INDEX PK_TRANSACTION1 ON [DBTEST].[dbo].[TRANSACTION](TRANSACTION_ID,TRANS_DATETIME) 
WITH (DROP_EXISTING = ON)
ON PScheme_NGD(TRANS_DATETIME)
go

--CAU HINH GUI EMAIL TRONG SQL SERVER
--http://www.sqlviet.com/blog/cau-hinh-sql-server-de-gui-mail
--bật chức năng Database Mail
SP_CONFIGURE 'show advanced options', 1;
GO
RECONFIGURE;
GO
SP_CONFIGURE 'Database Mail XPs', 1;
GO
RECONFIGURE
GO
--Gui email

EXEC  msdb.dbo.sp_send_dbmail
	@profile_name = 'luanvd support', --Tên profile tạo ở trên
	@recipients =  'hieudt@bontech.com.vn;vdluan.ictu@gmail.com', --list các địa chỉ nhận
	@body =  'this is test gui toi vdluan.ictu nhe', --nội dung email
	@body_format = 'HTML', --format html hay text
	@subject = 'dm cu hieu'; --tiêu đề

--theo dõi các email được gửi đi bằng cách truy vấn bảng dbo.sysmail_mailitems trong msdb database
SELECT *
FROM msdb.dbo.sysmail_mailitems

--Check nguyen nhan loi khong gui duoc email
--Lưu ý là sp_send_dbmail chỉ gửi mail vào hàng đợi để chuyển tới mail server, ngoài ra nó không theo dõi mail có được gửi đi thành công hay không. Trong trường hợp có trục trặc (sau một hồi bạn không nhận được mail), bạn truy vấn bảng dbo.sysmail_log cũng trong msdb database và xem cột description để biết nguyên nhân
SELECT * 
FROM msdb.dbo.sysmail_log
WHERE mailitem_id = 1 --thay 5 bằng mail item id bạn đang muốn tìm nguyên nhân