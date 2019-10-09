alter function EncryptedData(@strData nvarchar(500), @key nvarchar(100))
returns @strEncrypted table (strRoot nvarchar (500), keys nvarchar (100), strEncrypted varchar (2000))
as
begin
declare @EncryptedData varbinary(2000)
select @EncryptedData  = EncryptByPassPhrase(@key,@strData)

declare @strEncrypted1 varchar(2000)
select @strEncrypted1 = CONVERT(varchar(max), @EncryptedData, 2)

INSERT INTO @strEncrypted(strRoot,keys,strEncrypted)
 SELECT @strData, @key, @strEncrypted1

 return
end

go
alter function DecryptedData(@strData varchar(2000), @key nvarchar(100))
returns @strDecrypted table (strRoot nvarchar (500), keys nvarchar (100), strDecrypted varbinary (2000))
as
begin
declare @DecryptedData varchar(2000)
declare @strDecrypted1 varbinary(2000)
select @strDecrypted1 = CONVERT(varbinary(max), @strData, 2)
select @DecryptedData  = convert(varchar(1000),DecryptByPassPhrase(@key,@strDecrypted1))


INSERT INTO @strDecrypted(strRoot,keys,strDecrypted)
 SELECT @strData, @key, @DecryptedData

 return
end



select * from dbo.[EncryptedData]('laptrinhvb.net','123')

declare @te varchar(2000)  = '01000000DCA4B64D79300E9E3F66814B11C7676D59529BDF6626B231CE446866CE049B5042E91E1B008AAF56433F38CD68296633'
select * from  dbo.[DecryptedData](@te,'123')

declare @EncryptedData varbinary(2000)
select @EncryptedData  = EncryptByPassPhrase('123','laptrinhvb.net')
select @EncryptedData varbinaryData
declare @varcahr varchar(1000)
select @varcahr = CONVERT(varchar(max), @EncryptedData, 2) -- cast(@EncryptedData as varchar(max))
select CONVERT(varbinary(max), @varcahr, 2) varcharDataBinary -- cast(@EncryptedData as varchar(max))

select  EncryptByPassPhrase('123', 'laptrinhvb.net' )

declare @b varbinary(max)
set @b = 0x5468697320697320612074657374
