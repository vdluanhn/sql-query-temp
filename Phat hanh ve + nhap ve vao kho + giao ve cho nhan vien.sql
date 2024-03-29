/****** Script for SelectTopNRows command from SSMS  ******/

  --TAO DOT PHAT HANH VE
  --1. INSERT dot phat hanh ve vao bang TICKET_PUBLISH_CAMPAIGN
  select * from TICKET_PUBLISH_CAMPAIGN order by PUBLISH_CAMPAIGN_ID desc;
  --2. va insert bang nay nua
  select * from TICKET_PUBLISH order by PUBLISH_ID desc;
  --3. va bang chi tiet so luong ve phat hanh theo tung loai ve
  select * from TICKET_PUBLISH_DETAIL where PUBLISH_ID = 4;
  --4. va insert bang TICKET_REGISTRATION nua
  select * from TICKET_REGISTRATION where PUBLISH_CAMPAIGN_ID = 18;



  --NHAP VE VAO KHO (So luong va value ve phai nam trong so luong ve duoc phat hanh)
  --1. Insert ve vao bang TICKET voi [CURRENT_STAFF_ID] = null, [PUBLISH_CAMPAIGN_CODE] = nam phat hanh, [TICKET_PUBLISH_CODE] = loai ve phat hanh
  select * from TICKET where SYMBOL like 'HPTC11201%' order by SERIAL_VALUE asc;
  --2. Insert bang TICKET_TRANSACTION va TICKET_TRANSACTION_DETAIL luu lich su ve giao/nhan
  select * from TICKET_TRANSACTION order by TRANSACTION_ID desc;
  select * from TICKET_TRANSACTION_DETAIL order by TRANSACTION_DETAIL_ID desc


  --HUY VE TRONG KHO (Ve da giao cho nhan vien thi khong the huy duoc nua)
  --1. Delete ve da chon de huy khoi bang TICKET voi cac SERIAL thuoc serial ve chon de huy
  select * from TICKET where SYMBOL like 'HPTC11201%' order by SERIAL_VALUE asc;
  --2. Insert bang TICKET_TRANSACTION va TICKET_TRANSACTION_DETAIL luu lich su ve giao/nhan
  --THat bai: TRANSACTION_TYPE = 2 va DESCRIPTION = ["Hủy mã vé HPTC11201 từ serial 1 đến serial 5 không thành công. Vé HPTC112010000001 đã được giao cho nhân viên."]
  --Thanh cong: TRANSACTION_TYPE = 2 va DESCRIPTION = ["5 vé từ serial HPTC112010000011 đến serial HPTC112010000015 đã hủy thành công"]
  select * from TICKET_TRANSACTION order by TRANSACTION_ID desc;
  select * from TICKET_TRANSACTION_DETAIL order by TRANSACTION_DETAIL_ID desc;


  --GIAO VE CHO NHAN VIEN
  --1. Update CURRENT_STAFF_ID = staff_id nhan vien nhan ve trong bang TICKET
  select * from TICKET where CURRENT_STAFF_ID is not null and SYMBOL like 'HPTC11201%';
  --2. Insert bang AVAILABLE_TICKET voi STAFF_ID tuong ung id nhan vien duoc giao ve, STATUS = 1, TICKET_ID = id ve trong bang TICKET
  select * from AVAILABLE_TICKET where SERIAL like 'HPTC11201%';
  --3. Insert bang TICKET_TRANSACTION va TICKET_TRANSACTION_DETAIL luu lich su ve giao/nhan
  select * from TICKET_TRANSACTION order by TRANSACTION_ID desc;
  select * from TICKET_TRANSACTION_DETAIL order by TRANSACTION_DETAIL_ID desc

