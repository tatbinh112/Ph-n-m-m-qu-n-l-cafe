CREATE DATABASE QUANLY35MM_TEST
GO

USE MASTER

DROP DATABASE QUANLY35MM_TEST

use QUANLY35MM_TEST

go
create table MON
(
	MaMon varchar(3) unique,  
	TenMon	nvarchar(50) not null, 
	DonGiaB int not null,
	primary key(MaMon)
)
go

create table HANG	
(
	MaHang	varchar(10) unique, 
	TenHang	nvarchar(50) not null,
	DonGiaN int not null,
	primary key(MaHang)
)
go
create table NHACUNGCAP
(
	MaNCC	varchar(10) unique,  
	TenNCC	nvarchar(50) not null,
	SDT varchar(12) not null,
	DChiNCC nvarchar(200),
	STK nvarchar(200),
	primary key(MaNCC)
	
)

go

Create table BAN
(
	SoBan varchar(2) primary key,
	TinhTrang nvarchar(20) --Bàn trống, bàn đã được đặt trước, bàn có khách ngồi
)
go

create table NHANVIEN
(
	MaNV varchar(4) unique, 
	TENNV nvarchar(50) not null, 
	SDT varchar(12) not null,
	LoaiNV nvarchar(50) not null, -- Nhân viên, quản lý
	primary key(MANV)
)
go


Create table TAIKHOAN
(
	MaTK varchar(50) primary key,
	MaNV varchar(4),
	TenDangNhap varchar(50) not null,
	MatKhau varchar(50) not null 
	foreign key (MaNV) references NHANVIEN
)
go


create table NHAP
(
	MaDNH varchar(10) primary key,  
	MaNCC varchar(10),
	MaNV varchar(4),
	NgayNH date, 
	TongTien int,
	foreign key (MaNV) references NHANVIEN,
	foreign key (MaNCC ) references NHACUNGCAP
)
go
create table NHAPCHITIET
( 
	MaDNH varchar(10), 
	MaHang	varchar(10),
	SoLuong int ,
	ThanhTien int,
	primary key(MaDNH,MaHang),
	foreign key (MaDNH) references NHAP,
	foreign key (MaHang) references HANG
)
go

create table THANHTOAN
(
	MaHD varchar(10),  
	MaNV varchar(4),
	SoBan varchar(2),
	NgayTT date,
	GioVao time,
	GioRa time,
	TamTinh int,
	TongTien int ,
	ChietKhau float,
	primary key(MAHD),
	foreign key (SoBan)references BAN,
	foreign key (MaNV) references NHANVIEN
)
go

create table THANHTOANCHITIET
(  
	MaHD varchar(10),
	MaMon varchar(3),
	ThanhTien int,
	SoLuong int
	primary key(MaHD,MaMon),
	foreign key (MaHD) references  THANHTOAN,
	foreign key (MaMon) references  MON
)
go
DROP TABLE THANHTOANCHITIET
create nonclustered index NCI_TenMon on Mon(TenMon)
go

insert into MON values('001',N'Cà phê đen',13000)
insert into MON values('002',N'Cà phê sữa',15000)
insert into MON values('003',N'Bạc xỉu (Nóng/Đá)',20000)
insert into MON values('004',N'Cacao (Nóng/Đá)',22000)
insert into MON values('005',N'Cà phê kẹo đường',25000)
insert into MON values('006',N'Cà phê muối',25000)
insert into MON values('007',N'Sữa tươi kẹp đường',35000)
insert into MON values('008',N'Sữa chua đập',18000)
insert into MON values('009',N'Sữa chua hộp',12000)
insert into MON values('010',N'Sữa chua đá',20000)
insert into MON values('011',N'Sữa chua mix vị ',25000)
insert into MON values('012',N'Trà chanh',20000)
insert into MON values('013',N'Trà đào cam sả (Nóng/Đá)',30000)
insert into MON values('014',N'Trà gừng',20000)
insert into MON values('015',N'Trà dâu ổi hồng',30000)
insert into MON values('016',N'Trà việt quất thanh long',30000)
insert into MON values('017',N'Trà chanh dây cam bưởi',30000)
insert into MON values('018',N'Trà chanh dây dưa lưới',30000)
insert into MON values('019',N'Nước chanh (Nóng/Đá)',20000)
insert into MON values('020',N'Chanh xí muội (Nóng/Đá)',22000)
insert into MON values('021',N'Chanh nha đam hạt chia (Nóng/Đá)',25000)
insert into MON values('022',N'Ổi',25000)
insert into MON values('023',N'Cà rốt',25000)
insert into MON values('024',N'Thơm',25000)
insert into MON values('025',N'Cam',25000)
insert into MON values('026',N'Chanh dây',25000)
insert into MON values('027',N'Nước suối',12000)
insert into MON values('028',N'Khoáng lạt',15000)
insert into MON values('029',N'Sting',18000)
insert into MON values('030',N'Revive',18000)
insert into MON values('031',N'Coca',18000)
insert into MON values('032',N'Trà xanh không độ',18000)
insert into MON values('033',N'Bò húc',22000)
insert into MON values('034',N'Trà sữa truyền thống',25000)
insert into MON values('035',N'Trà sữa full thạch',30000)
insert into MON values('036',N'Trà sữa thái xanh truyền thống',25000)
insert into MON values('037',N'Trà sữa thái xanh đặc biệt',30000)
insert into MON values('038',N'Trà sữa thái xanh full thạch',30000)
insert into MON values('039',N'Trà sữa khoai môn truyền thống',30000)
insert into MON values('040',N'Trà sữa khoai môn đặc biệt',35000)
insert into MON values('041',N'Trà sữa khoai môn full thạch',35000)
insert into MON values('042',N'Trà sữa kem trứng dừa nướng',35000)
insert into MON values('043',N'Sữa tươi trân châu đường đen',25000)
insert into MON values('044',N'Sữa tươi kem trứng trân châu đường đen',30000)
insert into MON values('045',N'Sữa tươi trân châu đường đen matcha',30000)
insert into MON values('046',N'Sinh tố xoài',35000)
insert into MON values('047',N'Sinh tố bơ',35000)
insert into MON values('048',N'Sinh tố mãng cầu',35000)
insert into MON values('049',N'Sinh tố cà chua',30000)
insert into MON values('050',N'Sinh tố cà rốt',30000)
insert into MON values('051',N'Sinh tố thanh long',30000)
insert into MON values('052',N'Thạch nhà làm',10000)
insert into MON values('053',N'Banh flan',6000)
insert into MON values('054',N'Pudding',5000)
insert into MON values('055',N'Khúc bạch',5000)
insert into MON values('056',N'Nha đam',5000)
insert into MON values('057',N'Trân châu trắng',5000)
insert into MON values('058',N'Kem trứng',10000)
insert into MON values('059',N'Trà sữa kẹo đường',35000)
insert into MON values('060',N'Sữa chua dâu',30000)
insert into MON values('061',N'Hướng dương',50000)
insert into MON values('062',N'Trà đào cam sả',15000)

go
insert into HANG values ('001',N'Trân châu trắng' ,65000)
insert into HANG values ('002',N'Trân châu đen',  100000)
insert into HANG values ('003', N'Trà đen lộc xát',150000)
insert into HANG values ('004',N'Ca cao nguyên chất',75000)
insert into HANG values ('005',N'Đào lon',  40000)
insert into HANG values ('006',N'Cozy đào túi lọc',  35000)
insert into HANG values ('007',N'Cam thảo',  25000)
insert into HANG values ('008',N'Bione',70000)
insert into HANG values ('009',N'Đường đen',25000)
insert into HANG values ('010',N'Siro thái đào',65000)
insert into HANG values ('011',N'Siro dâu', 65000)
insert into HANG values ('012',N'Siro việt quất',  65000)
insert into HANG values ('013',N'Siro chanh',  60000)
insert into HANG values ('014',N'Siro táo',  60000)
insert into HANG values ('015',N'Siro cam',  60000)


go
insert into NHACUNGCAP VALUES ('001', N'Hùng Phú','0905966510',N'Kiốt 01 Hùng Vương Chợ Cồn, TP Đà Nẵng',N'19550487-ACB Đà Nẵng')
insert into NHACUNGCAP VALUES ('002', N'Xuân Hà', '0916221901', N'38 Trần Cao vân, Thanh Khê,TP Đà Nẵng',N'0905606720-VP Đà Nẵng')

go
insert into NHANVIEN values ('0001', N'Phan Văn Tài','0905333999','NV')
insert into NHANVIEN values ('0002', N'Nguyễn Văn Sang','0983256789','QL')
insert into NHANVIEN values ('0003', N'Ngô Văn Em','0904666777','NV')
insert into NHANVIEN values ('0004', N'Trần Văn Thế','0859256477','QL')
insert into NHANVIEN values ('0005', N'Nguyễn Quang Minh','0907888111','QL')
insert into NHANVIEN values ('0006', N'Nguyễn Minh An','0905167455','NV')
insert into NHANVIEN values ('0007', N'Nguyễn Xuân Minh','0378569126','QL')
insert into NHANVIEN values ('0008', N'Lê Quốc Khánh','0905257689','NV')
insert into NHANVIEN values ('0009', N'Lê Xuân Bách','0905257689','QL')
insert into NHANVIEN values ('0010', N'Nguyễn Tiến Đạt', '0932555478','NV')
insert into NHANVIEN values ('0011', N'Trần Quốc Anh', '0934658120','NV')

go
insert into  TAIKHOAN values('Nhanvien1','0001','phanvantai','0905333999')
insert into  TAIKHOAN values('Nhanvien10','0010','nguyentiendat','0932555478')
insert into  TAIKHOAN values('Quanly2','0002','nguyenvansang','0983256789')
insert into  TAIKHOAN values('Nhanvien3','0003','ngovanem','0904666777')
insert into  TAIKHOAN values('Quanly4','0004','tranvanthe','0859256477')
insert into  TAIKHOAN values('Quanly5','0005','nguyenquangminh','0907888111')
insert into  TAIKHOAN values('Nhanvien6','0006','nguyenminhan','0905167455')
insert into  TAIKHOAN values('Quanly7','0007','nguyenxuanminh','0378569126')
insert into  TAIKHOAN values('Nhanvien8','0008','lequockhanh','0905257689')
insert into  TAIKHOAN values('Quanly9','0009','lexuanbach','0905257689')
insert into  TAIKHOAN values('Nhanvien11','0011','tranquocanh','0934658120')
go


go
insert into BAN values('01',N'Trống')
insert into BAN values('02',N'Trống')
insert into BAN values('03',N'Trống')
insert into BAN values('04',N'Trống')
insert into BAN values('05',N'Trống')
insert into BAN values('06',N'Trống')
insert into BAN values('07',N'Trống')
insert into BAN values('08',N'Trống')
insert into BAN values('09',N'Trống')
insert into BAN values('10',N'Trống')
insert into BAN values('11',N'Trống')
insert into BAN values('12',N'Trống')
insert into BAN values('13',N'Trống')
insert into BAN values('14',N'Trống')
insert into BAN values('15',N'Trống')
insert into BAN values('16',N'Trống')
insert into BAN values('17',N'Trống')
insert into BAN values('18',N'Trống')
insert into BAN values('19',N'Trống')
insert into BAN values('20',N'Trống')
insert into BAN values('21',N'Trống')
insert into BAN values('22',N'Trống')
insert into BAN values('23',N'Trống')
insert into BAN values('24',N'Trống')


go

insert into NHAP values ('N001','001','0001','2021-05-25',2000000)
insert into NHAP values ('N002','002','0002','2021-07-26',3500000)
insert into NHAP values ('N003','001','0003','2021-09-05',1000000)
insert into NHAP values ('N004','002','0004','2021-11-29',1500000)
insert into NHAP values ('N005','001','0005','2022-03-30',890000)
insert into NHAP values ('N006','001','0005','2022-05-15',725000)
insert into NHAP values ('N007','002','0006','2022-07-20',5802000)
insert into NHAP values ('N008','001','0007','2022-09-05',2562400)
insert into NHAP values ('N009','002','0008','2022-10-08',2500000)
insert into NHAP values ('N010','002','0009','2022-11-28',5612500)


go
insert into NHAPCHITIET values ('N001','001',2,null)
insert into NHAPCHITIET values ('N001','003',1,null)
insert into NHAPCHITIET values ('N001','002',1,null)
insert into NHAPCHITIET values ('N001','006',2,null)
insert into NHAPCHITIET values ('N001','009',2,null)

insert into NHAPCHITIET values ('N002','010',2,null)
insert into NHAPCHITIET values ('N002','011',2,null)
insert into NHAPCHITIET values ('N002','012',4,null)
insert into NHAPCHITIET values ('N002','014',6,null)
insert into NHAPCHITIET values ('N002','015',4,null)
insert into NHAPCHITIET values ('N002','013',3,null)

insert into NHAPCHITIET values ('N003','004',2,null)
insert into NHAPCHITIET values ('N003','005',5,null)
insert into NHAPCHITIET values ('N003','007',6,null)
insert into NHAPCHITIET values ('N003','009',8,null)

insert into NHAPCHITIET values ('N004','010',3,null)
insert into NHAPCHITIET values ('N004','011',3,null)
insert into NHAPCHITIET values ('N004','012',2,null)
insert into NHAPCHITIET values ('N004','013',5,null)
insert into NHAPCHITIET values ('N004','014',3,null)
insert into NHAPCHITIET values ('N004','015',2,null)
insert into NHAPCHITIET values ('N004','009',3,null)

insert into NHAPCHITIET values ('N005','001',2,null)
insert into NHAPCHITIET values ('N005','002',1,null)
insert into NHAPCHITIET values ('N005','003',1,null)
insert into NHAPCHITIET values ('N005','007',2,null)
insert into NHAPCHITIET values ('N005','008',1,null)
											   
insert into NHAPCHITIET values ('N006','002',2,null)
insert into NHAPCHITIET values ('N006','003',1,null)
insert into NHAPCHITIET values ('N006','009',2,null)
											
insert into NHAPCHITIET values ('N007','012',6,null)
insert into NHAPCHITIET values ('N007','013',6,null)

insert into NHAPCHITIET values ('N008','002',2,null)
insert into NHAPCHITIET values ('N008','004',2,null)
insert into NHAPCHITIET values ('N008','006',2,null)
insert into NHAPCHITIET values ('N008','007',6,null)

insert into NHAPCHITIET values ('N009','011',8,null)
insert into NHAPCHITIET values ('N009','014',8,null)

insert into NHAPCHITIET values ('N010','010',4,null)
insert into NHAPCHITIET values ('N010','012',8,null)
insert into NHAPCHITIET values ('N010','015',6,null)

go
insert into THANHTOAN values('HD001','0001','01','2023-05-25','9:00','15:00', null,null,0.02)
insert into THANHTOAN values('HD002','0002','02','2023-07-26','13:00','17:00',null,null,0)
insert into THANHTOAN values('HD003','0003','03','2023-09-05','19:00','21:00',null,null,0.01)
insert into THANHTOAN values('HD004','0004','04','2023-02-08','7:00','16:00', null,null,0)
insert into THANHTOAN values('HD005','0005','05','2023-03-30','11:00','15:00',null,null,0)
insert into THANHTOAN values('HD006','0006','06','2023-10-10','7:23','9:30', null,null,0)

go


insert into  THANHTOANCHITIET values('HD001','004',null,1)
insert into  THANHTOANCHITIET values('HD001','003',null,2)


insert into  THANHTOANCHITIET values('HD002','002',null,4)
insert into  THANHTOANCHITIET values('HD002','010',null,1)
insert into  THANHTOANCHITIET values('HD002','009',null,1)

insert into  THANHTOANCHITIET values('HD003','003',null,1)
insert into  THANHTOANCHITIET values('HD003','013',null,6)

insert into  THANHTOANCHITIET values('HD004','004',null,2)
insert into  THANHTOANCHITIET values('HD004','021',null,1)
insert into  THANHTOANCHITIET values('HD004','011',null,2)


insert into  THANHTOANCHITIET values('HD005','001',null,2)
insert into  THANHTOANCHITIET values('HD005','005',null,2)
insert into  THANHTOANCHITIET values('HD005','012',null,2)

												  

insert into  THANHTOANCHITIET values('HD006','006',null,1)
insert into  THANHTOANCHITIET values('HD006','001',null,2)
insert into  THANHTOANCHITIET values('HD006','002',null,1)
insert into  THANHTOANCHITIET values('HD006','012',null,2)


go


----HD001
UPDATE THANHTOANCHITIET
SET SoLuong = 2
WHERE MaHD = 'HD001' and MaMon = '003'

UPDATE THANHTOANCHITIET
SET SoLuong = 1
WHERE MaHD = 'HD001' and MaMon = '004'


---HD002
UPDATE THANHTOANCHITIET
SET SoLuong = 4
WHERE MaHD = 'HD002' and MaMon = '002'

UPDATE THANHTOANCHITIET
SET SoLuong = 1
WHERE MaHD = 'HD002' and MaMon = '009'

UPDATE THANHTOANCHITIET
SET SoLuong = 1
WHERE MaHD = 'HD002' and MaMon = '010'


---HD003

UPDATE THANHTOANCHITIET
SET SoLuong = 1
WHERE MaHD = 'HD003' and MaMon = '003'

UPDATE THANHTOANCHITIET
SET SoLuong = 6
WHERE MaHD = 'HD003' and MaMon = '013'

-----HD004
UPDATE THANHTOANCHITIET
SET SoLuong = 2
WHERE MaHD = 'HD004' and MaMon = '004'


UPDATE THANHTOANCHITIET
SET SoLuong = 2
WHERE MaHD = 'HD004' and MaMon = '011'

UPDATE THANHTOANCHITIET
SET SoLuong = 1
WHERE MaHD = 'HD004' and MaMon = '021'


----HD005

UPDATE THANHTOANCHITIET
SET SoLuong = 2
WHERE MaHD = 'HD005' and MaMon = '001'

UPDATE THANHTOANCHITIET
SET SoLuong = 2
WHERE MaHD = 'HD005' and MaMon = '005'

UPDATE THANHTOANCHITIET
SET SoLuong = 2
WHERE MaHD = 'HD005' and MaMon = '012'


----HD006
UPDATE THANHTOANCHITIET
SET SoLuong = 2
WHERE MaHD = 'HD006' and MaMon = '001'

UPDATE THANHTOANCHITIET
SET SoLuong = 1
WHERE MaHD = 'HD006' and MaMon = '002'

UPDATE THANHTOANCHITIET
SET SoLuong = 1
WHERE MaHD = 'HD006' and MaMon = '006'

UPDATE THANHTOANCHITIET
SET SoLuong = 2
WHERE MaHD = 'HD006' and MaMon = '012'



----NHẬP HÀNG
---N001
UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N001' AND MaHang = '001'

UPDATE NHAPCHITIET
SET SoLuong = 1
WHERE MaDNH = 'N001' AND MaHang = '002'

UPDATE NHAPCHITIET
SET SoLuong = 1
WHERE MaDNH = 'N001' AND MaHang = '003'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N001' AND MaHang = '006'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N001' AND MaHang = '009'


---N002
UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N002' AND MaHang = '010'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N002' AND MaHang = '011'

UPDATE NHAPCHITIET
SET SoLuong = 4
WHERE MaDNH = 'N002' AND MaHang = '012'

UPDATE NHAPCHITIET
SET SoLuong = 3
WHERE MaDNH = 'N002' AND MaHang = '013'

UPDATE NHAPCHITIET
SET SoLuong = 6
WHERE MaDNH = 'N002' AND MaHang = '014'

UPDATE NHAPCHITIET
SET SoLuong = 4
WHERE MaDNH = 'N002' AND MaHang = '015'



---N003
UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N003' AND MaHang = '004'

UPDATE NHAPCHITIET
SET SoLuong = 5
WHERE MaDNH = 'N003' AND MaHang = '005'

UPDATE NHAPCHITIET
SET SoLuong = 6
WHERE MaDNH = 'N003' AND MaHang = '007'

UPDATE NHAPCHITIET
SET SoLuong = 8
WHERE MaDNH = 'N003' AND MaHang = '009'


---N004
UPDATE NHAPCHITIET
SET SoLuong = 3
WHERE MaDNH = 'N004' AND MaHang = '009'

UPDATE NHAPCHITIET
SET SoLuong = 3
WHERE MaDNH = 'N004' AND MaHang = '010'

UPDATE NHAPCHITIET
SET SoLuong = 3
WHERE MaDNH = 'N004' AND MaHang = '011'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N004' AND MaHang = '012'

UPDATE NHAPCHITIET
SET SoLuong = 5
WHERE MaDNH = 'N004' AND MaHang = '013'

UPDATE NHAPCHITIET
SET SoLuong = 3
WHERE MaDNH = 'N004' AND MaHang = '014'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N004' AND MaHang = '015'



---N005
UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N005' AND MaHang = '001'

UPDATE NHAPCHITIET
SET SoLuong = 1
WHERE MaDNH = 'N005' AND MaHang = '002'

UPDATE NHAPCHITIET
SET SoLuong = 1
WHERE MaDNH = 'N005' AND MaHang = '003'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N005' AND MaHang = '007'

UPDATE NHAPCHITIET
SET SoLuong = 1
WHERE MaDNH = 'N005' AND MaHang = '008'


---N006
UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N006' AND MaHang = '002'

UPDATE NHAPCHITIET
SET SoLuong = 1
WHERE MaDNH = 'N006' AND MaHang = '003'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N006' AND MaHang = '009'


---N007
UPDATE NHAPCHITIET
SET SoLuong = 6
WHERE MaDNH = 'N007' AND MaHang = '012'

UPDATE NHAPCHITIET
SET SoLuong = 6
WHERE MaDNH = 'N007' AND MaHang = '013'

---N008
UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N008' AND MaHang = '002'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N008' AND MaHang = '004'

UPDATE NHAPCHITIET
SET SoLuong = 2
WHERE MaDNH = 'N008' AND MaHang = '006'

UPDATE NHAPCHITIET
SET SoLuong = 6
WHERE MaDNH = 'N008' AND MaHang = '007'

---N009
UPDATE NHAPCHITIET
SET SoLuong = 8
WHERE MaDNH = 'N009' AND MaHang = '011'

UPDATE NHAPCHITIET
SET SoLuong = 8
WHERE MaDNH = 'N009' AND MaHang = '014'


----N010
UPDATE NHAPCHITIET
SET SoLuong = 4
WHERE MaDNH = 'N010' AND MaHang = '010'

UPDATE NHAPCHITIET
SET SoLuong = 8
WHERE MaDNH = 'N010' AND MaHang = '012'

UPDATE NHAPCHITIET
SET SoLuong = 6
WHERE MaDNH = 'N010' AND MaHang = '015'









SELECT LoaiNV FROM NHANVIEN,TAIKHOAN WHERE TAIKHOAN.MaNV = NHANVIEN.MaNV AND TenDangNhap = 'nguyenvansang'