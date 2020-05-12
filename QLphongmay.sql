/*CREATE DATABASE*/
create database QLPhongMay
/*USE DATABASE*/
use QLPhongMay
/*CREATE TABLE*/
-------------------------------------------------------
create table MAYTINH
(
	maMT varchar(30) NOT NULL primary key,
	tenMT nvarchar(30),
	ngaynhap date,
	tinhtrang nvarchar(30),
)
create table PHONGMAY
(
	maPM varchar(30) NOT NULL primary key,
	maMT varchar(30) NOT NULL,
	tenPM nvarchar(30),
	diadiemPM nvarchar(30),
	ngaytruc date,
	noidungtruc nvarchar(30),
	constraint FK_PHONGMAY_MAYTINH foreign key(maMT) references MAYTINH(maMT),
)
create table NHANVIEN
(
	maNV varchar(30) NOT NULL primary key,
	maPM varchar(30) NOT NULL,
	tenNV nvarchar(30),
	ngaysinhNV date,
	gioitinhNV nvarchar(10),
	diachiNV nvarchar(30),
	constraint FK_NHANVIEN_PHONGMAY foreign key(maPM) references PHONGMAY(maPM),
)
create table SINHVIEN
(
	maSV varchar(30)  NOT NULL primary key,
	hotenSV nvarchar(30),
	ngaysinhSV date,
	gioitinhSV nvarchar(10),
	diachiSV nvarchar(30),
)
create table LOPHOCPHAN
(
	maLHP varchar(30) NOT NULL primary key,
	maSV varchar(30) NOT NULL,
	tenLHP nvarchar(30),
	tenHP nvarchar(30), 
)
create table GIAOVIEN
(
	maGV varchar(30) NOT NULL primary key,
	maLHP varchar(30) NOT NULL,
	hotenGV nvarchar(30),
	ngaysinhGV date,
	gioitinhGV nvarchar(10),
	diachiGV nvarchar(30),
	constraint FK_GIAOVIEN_LOPHOCPHAN foreign key(maLHP) references LOPHOCPHAN(maLHP),
)
create table LICHTHUCHANH
(
	maLTH varchar(30) NOT NULL primary key,
	maGV varchar(30) NOT NULL,
	ngayTH date,
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
	maSV varchar(30)  NOT NULL,
	hotenSV nvarchar(30),
	constraint PK_CT_LOPHOCPHAN_SINHVIEN primary key(maLHP,maSV),
	constraint FK_CT_LOPHOCPHAN_LHP_FK foreign key(maLHP) references LOPHOCPHAN(maLHP),
	constraint FK_CT_LOPHOCPHAN_SV_FK foreign key(maSV) references SINHVIEN(maSV),
)
----------------------------------------------------------------------

/*DATA*/
-----------------------------------------------
--MAYTINH--
insert into MAYTINH values ('M01',N'MÁY 01','2018-12-21',N'TỐT')
insert into MAYTINH values ('M02',N'MÁY 02','2018-01-11',N'TỐT')
insert into MAYTINH values ('M03',N'MÁY 03','2018-06-25',N'TỐT')
insert into MAYTINH values ('M04',N'MÁY 04','2018-12-15',N'LỖI PHẦN MỀM')
insert into MAYTINH values ('M05',N'MÁY 05','2018-05-13',N'TỐT')

--PHONGMAY--
insert into PHONGMAY values ('PM01','M01',N'MÁY 01',N'PHÒNG MÁY 01','2020-05-13',N'CA 01')

--NHANVIEN--
insert into NHANVIEN values()

--LOPHOCPHAN--
insert into LOPHOCPHAN values()

--SINHVIEN--
insert into SINHVIEN values()

--CT_LOPHOCPHAN--
insert into LOPHOCPHAN values()

--GIAOVIEN--
insert into GIAOVIEN values()

--CT_GIAOVIEN--
insert into CT_GIAOVIEN values()

--LICHHUCHANH--
insert into LICHTHUCHANH values()

--CT_LICHTHUCHANH--
insert into CT_LICHTHUCHANH values()

--CHITIETTHUCHANH--
insert into CHITIETTHUCHANH values()

-----------------------------------------------

/*T-SQL*/


/*DROP DATABASE*/
use master
drop database QLPhongMay