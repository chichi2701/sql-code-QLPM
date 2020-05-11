create database QLPhongMay
use QLPhongMay

create table MAYTINH
(
	maMT varchar(30) NOT NULL primary key,
	tenMT nvarchar(30),
	ngaynhap datetime,
	tinhtrang nvarchar(30),
)
create table PHONGMAY
(
	maPM varchar(30) NOT NULL primary key,
	maMT varchar(30) NOT NULL,
	tenPM nvarchar(30),
	diadiemPM nvarchar(30),
	ngaytruc datetime,
	noidungtruc nvarchar(30),
	constraint FK_PHONGMAY_MAYTINH foreign key(maMT) references MAYTINH(maMT),
)
create table NHANVIEN
(
	maNV varchar(30) NOT NULL primary key,
	maPM varchar(30) NOT NULL,
	tenNV nvarchar(30),
	ngaysinhNV datetime,
	gioitinhNV nvarchar(10),
	diachiNV nvarchar(30),
	constraint FK_NHANVIEN_PHONGMAY foreign key(maPM) references PHONGMAY(maPM),
)
create table SINHVIEN
(
	maSV varchar(30)  NOT NULL primary key,
	hotenSV nvarchar(30),
	ngaysinhSV datetime,
	gioitinhSV nvarchar(10),
	diachiSV nvarchar(30),
)
create table LOPHOCPHAN
(
	maLHP varchar(30) NOT NULL primary key,
	maSV varchar(30) NOT NULL,
	tenLHP nvarchar(30),
	tenHP nvarchar(30),
	constraint FK_LOPHOCPHAN_SINHVIEN foreign key(maSV) references SINHVIEN(maSV), 
)
create table GIAOVIEN
(
	maGV varchar(30) NOT NULL primary key,
	maLHP varchar(30) NOT NULL,
	hotenGV nvarchar(30),
	ngaysinhGV datetime,
	gioitinhGV nvarchar(10),
	diachiGV nvarchar(30),
	constraint FK_GIAOVIEN_LOPHOCPHAN foreign key(maLHP) references LOPHOCPHAN(maLHP),
)
create table LICHTHUCHANH
(
	maLTH varchar(30) NOT NULL primary key,
	maGV varchar(30) NOT NULL,
	ngayTH datetime,
	noidungTH nvarchar(30),
	constraint FK_LICHTHUCHANH_GIAOVIEN foreign key(maGV) references GIAOVIEN(maGV),
)
create table CHITIETTHUCHANH
(
	maNV varchar(30) NOT NULL,
	maLTH varchar(30) NOT NULL,
	gioBD time,
	gioKT time,
	constraint CTTH_LICHTHUCHANH_GIAOVIEN primary key(maNV,maLTH),
	constraint CTTH_NHANVIEN_FK foreign key(maNV) references NHANVIEN(maNV),
	constraint CTTH_LICHTHUCHANH_FK foreign key(maLTH) references LICHTHUCHANH(maLTH),
)
create table CT_LICHTHUCHANH
(
	maLTH varchar(30) NOT NULL,
	hotenGV nvarchar(30),
	constraint PK_CT_LICHTHUCHANH_GIAOVIEN primary key(maLTH),
	constraint FK_CT_LICHTHUCHANH_GIAOVIEN foreign key(maLTH) references LICHTHUCHANH(maLTH),
)
create table CT_GIAOVIEN
(
	maGV varchar(30) NOT NULL,
	tenLHP nvarchar(30),
	constraint PK_CT_GIAOVIEN_LOPHOCPHAN primary key(maGV),
	constraint FK_CT_GIAOVIEN_LOPHOCPHAN foreign key(maGV) references GIAOVIEN(maGV),
)
create table CT_LOPHOCPHAN
(
	maLHP varchar(30) NOT NULL,
	hotenSV nvarchar(30),
	constraint PK_CT_LOPHOCPHAN_SINHVIEN primary key(maLHP),
	constraint FK_CT_LOPHOCPHAN_SINHVIEN foreign key(maLHP) references LOPHOCPHAN(maLHP),
)