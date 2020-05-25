/*CREATE DATABASE*/
create database QLPhongMay
/*USE DATABASE*/
use QLPhongMay
/*CREATE TABLE*/
-------------------------------------------------------

create table PHONGMAY
(
	maPM varchar(30) NOT NULL primary key,
	tenPM nvarchar(30),
	diadiemPM nvarchar(30),
	ngaytruc date,
	noidungtruc nvarchar(30),	
)
create table MAYTINH
(
	maMT varchar(30) NOT NULL primary key,
	tenMT nvarchar(30),
	ngaynhap date,
	tinhtrang nvarchar(30),
	maPM varchar(30) NOT NULL,
	constraint FK_PHONGMAY_MAYTINH foreign key(maPM) references PHONGMAY(maPM),
)
create table NHANVIEN
(
	maNV varchar(30) NOT NULL primary key,
	tenNV nvarchar(30),
	ngaysinhNV date,
	gioitinhNV nvarchar(10),
	diachiNV nvarchar(30),
	maPM varchar(30) NOT NULL,
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
	tenLHP nvarchar(30),
	tenHP nvarchar(30), 
)
create table GIAOVIEN
(
	maGV varchar(30) NOT NULL primary key,
	hotenGV nvarchar(30),
	ngaysinhGV date,
	gioitinhGV nvarchar(10),
	diachiGV nvarchar(30),	
)
create table LICHTHUCHANH
(
	maLTH varchar(30) NOT NULL primary key,
	ngayTH date,
	noidungTH nvarchar(30),
)
create table CT_LICHTHUCHANH
(
	maLTH varchar(30) NOT NULL,
	ngayTH date,
	maNV varchar(30) NOT NULL,
	tenNV nvarchar(30),
	maGV varchar(30) NOT NULL,
	hotenGV nvarchar(30),
	ca varchar(30),
	gioBD time,
	gioKT time,
	constraint CT_LICHTHUCHANH_PM primary key(maLTH,maNV,maGV),
	constraint CTLTH_NHANVIEN_FK foreign key(maNV) references NHANVIEN(maNV),
	constraint CTLTH_LICHTHUCHANH_FK foreign key(maLTH) references LICHTHUCHANH(maLTH),
	constraint CTLTH_GIAOVIEN_FK foreign key(maGV) references GIAOVIEN(maGV)
)

create table CT_HOCPHAN
(
	maLHP varchar(30) NOT NULL,
	tenLHP nvarchar(30),
	maGV varchar(30) NOT NULL,
	hotenGV nvarchar(30),
	maSV varchar(30)  NOT NULL,
	hotenSV nvarchar(30),
	constraint CT_HOCPHAN_PK primary key(maLHP,maGV,maSV),
	constraint CTHP_LOPHOCPHAN_FK foreign key(maLHP) references LOPHOCPHAN(maLHP),
	constraint CTHP_GIAOVIEN_FK foreign key(maGV) references GIAOVIEN(maGV),
	constraint CTHP_SINHVIEN_FK foreign key(maSV) references SINHVIEN(maSV)
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

--LICHTHUCHANH--
insert into LICHTHUCHANH values()

--LOPHOCPHAN--
insert into LOPHOCPHAN values()

--SINHVIEN--
insert into SINHVIEN values()

--GIAOVIEN--
insert into GIAOVIEN values()

--CT_HOCPHAN--
insert into CT_HOCPHAN values()

--CT_LICHTHUCHANH--
insert into CT_LICHTHUCHANH values()


-----------------------------------------------

/*T-SQL*/


/*DROP DATABASE*/
use master
drop database QLPhongMay