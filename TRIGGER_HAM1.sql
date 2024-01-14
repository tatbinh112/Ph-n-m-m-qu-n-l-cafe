--Tính thành tiền trong bảng THANHTOANCHITIET
Create or alter trigger tg_Thanhtien_TTCT
on THANHTOANCHITIET
for insert, update
as
begin
	declare @Soluong int, @DongiaB int, @MaHD varchar(10), @Mamon varchar(10),@Chietkhau float
	set @Soluong =(select SoLuong from inserted)
	set @Mamon = (select Mamon from inserted)
	set @Chietkhau = (select Chietkhau from THANHTOAN where @MaHD =MaHD)
	set @DongiaB =(select DongiaB from MON where @Mamon = Mamon)
	set @MaHD =(select MaHD from inserted)

	update THANHTOANCHITIET
	set Thanhtien =@Soluong*@DongiaB
	where @MaHD=MaHD and @Mamon=Mamon
	update THANHTOAN
    SET TamTinh = (SELECT SUM(Thanhtien) FROM THANHTOANCHITIET WHERE MaHD = @MaHD),
        TongTien = (SELECT SUM(Thanhtien) FROM THANHTOANCHITIET WHERE MaHD = @MaHD) - ((SELECT SUM(Thanhtien) FROM THANHTOANCHITIET WHERE MaHD = @MaHD) * @ChietKhau)
    WHERE MaHD = @MaHD
end
go 
select *from THANHTOANCHITIET
--Tính tổng tiền,tổng cộng sau khi khi chiết khâu trong THANHTOAN
go
CREATE OR ALTER TRIGGER tg_Tongtien_TT
ON THANHTOAN
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaHD VARCHAR(10), @Tamtinh INT, @ChietKhau FLOAT 
    SELECT @MaHD = MaHD, @TamTinh = Tamtinh, @ChietKhau = ChietKhau FROM inserted

    UPDATE THANHTOAN
    SET TamTinh = (SELECT SUM(Thanhtien) FROM THANHTOANCHITIET WHERE MaHD = @MaHD),
        TongTien = (SELECT SUM(Thanhtien) FROM THANHTOANCHITIET WHERE MaHD = @MaHD) - ((SELECT SUM(Thanhtien) FROM THANHTOANCHITIET WHERE MaHD = @MaHD) * @ChietKhau)
    WHERE MaHD = @MaHD
END
GO

select*from THANHTOAN
select*from THANHTOANCHITIET

--Tính Thành tiên NHAPCHITIET
go
create or alter trigger tg_Thanhtien_NCT
on NHAPCHITIET
for insert,update
as
begin
	declare @SoluongHN int, @DonGia int, @MaHang varchar(10), @MaDNH varchar(10)
	select @SoluongHN =Soluong, @MaHang=MaHang, @MaDNH= MaDNH from inserted
	set @DonGia =(select DonGiaN from HANG where @MaHang =MaHang)

	update NHAPCHITIET
	set ThanhTien=@DonGia *@SoluongHN
	where @MaDNH =MaDNH and @MaHang=MaHang
	update NHAP
	set Tongtien =(select sum(Thanhtien) from NHAPCHITIET where @MaDNH=MaDNH)
	where @MaDNH=MaDNH
end



--Tính Tổng tiền bảng NHẬP
go
Create trigger tg_Tongtien_N
on NHAP
for insert,update
as
begin
	declare @MaDNH varchar(10)
	select @MaDNH =MaDNH from inserted

	update NHAP
	set Tongtien =(select sum(Thanhtien) from NHAPCHITIET where @MaDNH=MaDNH)
	where @MaDNH=MaDNH
end
go
insert into nhap values('N089','2021-05-25',null,'001','0001')
select*from NHAP
--Mã món tăng tự động (dùng hàm)
go
create or alter function fMamonNew()
returns varchar(3)
as
begin
	declare @Mamonmax varchar(3)
	set @Mamonmax =(select max(cast(Mamon as numeric(3,0)))+1 from Mon)
	return concat(replicate('0',3-len(@Mamonmax)),@Mamonmax)
end
--test
print dbo.fMaMonNew()
go
insert into MON values( dbo.fMaMonNew() ,N'Món thêm',123456, 0)
select * from MON
--Thêm bàn, bàn tăng tự động (hàm)
go
create or alter function fSoBanNew()
returns varchar(2)
as 
begin
	declare @Sobanmax varchar(2)
	set @Sobanmax =(select max(cast(Soban as numeric(2,0)))+1 from ban)
	return concat(replicate('0',2-len(@Sobanmax)),@Sobanmax)
end
go
--test
print dbo.fSoBanNew()
go

insert into BAN values(dbo.fSoBanNew() , N'Đã đặt trước',0)
go
select *from ban
--Thêm nv, mã nv tăng tự động (hàm)
go
create or alter function fMaNVnew()
returns varchar(4)
as 
begin
	declare @MaNVmax varchar(4)
	set @MaNVmax =(select max(cast(MaNV as numeric(4,0)))+1 from NHANVIEN)
	return concat(replicate('0',4-len(@MaNVmax)),@MaNVmax)
end
go
--test
print dbo.fMaNVNew()
go
select* from NHANVIEN 

insert into NHANVIEN values(dbo.fMaNVNew(), N'ThanhNga', '0905606720', 'NV', 0)
go


--mã hóa đơn tăng tự động:
go
create or alter function fMahd()
returns varchar(10)
as
begin
	declare @Mahdmax varchar(5)
	set @Mahdmax=(select max(MaHD) FROM THANHTOAN )
	SET @Mahdmax = CONVERT(int,Right(@Mahdmax,3))
	SET @Mahdmax = @Mahdmax + 1
	Set @Mahdmax = REPLICATE('0',3-len(@Mahdmax)) + @Mahdmax
	return 'HD' + @Mahdmax
end

--test:
print dbo.fMahd()
insert into THANHTOAN values(dbo.fMahd(),'2023-05-25','9:00','15:00',70000,68600,0.02,'0001','01')
select *from thanhtoan
select *from THANHTOANCHITIET

--MÃ ĐƠN NHẬP TĂNG TỰ ĐỘNG
go
create or alter function fMadnh()
returns varchar(10)
as
begin
	declare @Madnhmax varchar(5)
	set @Madnhmax=(select max(MaDNH) FROM NHAP )
	SET @Madnhmax = CONVERT(int,Right(@Madnhmax,3))
	SET @Madnhmax = @Madnhmax + 1
	Set @Madnhmax = REPLICATE('0',3-len(@Madnhmax)) + @Madnhmax
	return 'N' + @Madnhmax
end
print dbo.fMadnh()
--
insert into THANHTOAN values(dbo.fMahd(),'2023-05-25','9:00','15:00',null,null,0.02,'0001','01')
insert into  THANHTOANCHITIET values('HD007','012',null,1)
select *from THANHTOAN
select*from THANHTOANCHITIET

insert into NHAP values (dbo.fMadnh(),'2021-05-25',null,'001','0001')
insert into NHAPCHITIET values ('N011','011',4,null)
select*from NHAP
select*from NHAPCHITIET




