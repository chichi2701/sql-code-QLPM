create database QLPhongMay
go
use QLPhongMay
go
-------------------------------------------------------
create table PHONGMAY
(
	maPM varchar(30) NOT NULL primary key,
	tenPM nvarchar(30),
	diadiemPM nvarchar(30),	
)
go
create table MAYTINH
(
	maMT varchar(30) NOT NULL primary key,
	tenMT nvarchar(30),
	ngaynhap date,
	tinhtrang nvarchar(30),
	maPM varchar(30),
	constraint FK_MAYTINH_PHONGMAY foreign key(maPM) references PHONGMAY(maPM),
)
go
create table NHANVIEN
(
	maNV varchar(30) NOT NULL primary key,
	tenNV nvarchar(30),
	ngaysinhNV date,
	gioitinhNV nvarchar(3) check(gioitinhNV in('Nam',N'Nữ')),
	diachiNV nvarchar(30),
	maPM varchar(30) NOT NULL,
	constraint FK_NHANVIEN_PHONGMAY foreign key(maPM) references PHONGMAY(maPM),
)
go
create table SINHVIEN
(
	maSV varchar(30)  NOT NULL primary key,
	hotenSV nvarchar(30),
	ngaysinhSV date,
	gioitinhSV nvarchar(3) check(gioitinhSV in('Nam',N'Nữ')),
	diachiSV nvarchar(30),
)
go
create table LOPHOCPHAN
(
	maLHP varchar(30) NOT NULL primary key,
	tenLHP nvarchar(30),
	tenHP nvarchar(30), 
)
go
create table GIAOVIEN
(
	maGV varchar(30) NOT NULL primary key,
	hotenGV nvarchar(30),
	ngaysinhGV date,
	gioitinhGV nvarchar(3)check(gioitinhGV in('Nam',N'Nữ')),
	diachiGV nvarchar(30),	
)
go
create table LICHTHUCHANH
(
	maLTH varchar(30) NOT NULL primary key,
	ngayTH date,
	noidungTH nvarchar(30),
)
go
create table CT_THUCHANH
(
	maLTH varchar(30) NOT NULL,
	maNV varchar(30) NOT NULL,
	maGV varchar(30) NOT NULL,
	ngayTH date,	
	tenNV nvarchar(30),	
	hotenGV nvarchar(30),
	ca varchar(30),
	gioBD time,
	gioKT time,
	constraint CT_LICHTHUCHANH_PM primary key(maLTH,maNV,maGV),
	constraint CTLTH_NHANVIEN_FK foreign key(maNV) references NHANVIEN(maNV),
	constraint CTLTH_LICHTHUCHANH_FK foreign key(maLTH) references LICHTHUCHANH(maLTH),
	constraint CTLTH_GIAOVIEN_FK foreign key(maGV) references GIAOVIEN(maGV)
)
go
create table CT_HOCPHAN
(
	maLHP varchar(30) NOT NULL,
	maGV varchar(30) NOT NULL,
	maSV varchar(30)  NOT NULL,
	tenLHP nvarchar(30),
	hotenGV nvarchar(30),
	hotenSV nvarchar(30),
	constraint CT_HOCPHAN_PK primary key(maLHP,maGV,maSV),
	constraint CTHP_LOPHOCPHAN_FK foreign key(maLHP) references LOPHOCPHAN(maLHP),
	constraint CTHP_GIAOVIEN_FK foreign key(maGV) references GIAOVIEN(maGV),
	constraint CTHP_SINHVIEN_FK foreign key(maSV) references SINHVIEN(maSV)
)
go

----------------------------------------------------------------------

/*DATA*/
-----------------------------------------------
--PHONGMAY--
insert into PHONGMAY values ('PM01',N'PHÒNG MÁY 01',N'TẦNG 1')
insert into PHONGMAY values ('PM02',N'PHÒNG MÁY 02',N'TẦNG 2')
--MAYTINH--
insert into MAYTINH values ('M01',N'MÁY 01','2018-12-21',N'TỐT','PM01')
insert into MAYTINH values ('M02',N'MÁY 02','2018-01-11',N'TỐT','PM01')
insert into MAYTINH values ('M03',N'MÁY 03','2018-06-25',N'TỐT','PM01')
insert into MAYTINH values ('M04',N'MÁY 04','2018-12-15',N'LỖI PHẦN MỀM','PM01')
insert into MAYTINH values ('M05',N'MÁY 05','2018-05-13',N'TỐT','PM01')
insert into MAYTINH values ('M06',N'MÁY 06','2018-05-13',N'TỐT','PM01')
insert into MAYTINH values ('M07',N'MÁY 07','2018-05-13',N'TỐT','PM01')
insert into MAYTINH values ('M08',N'MÁY 08','2018-05-13',N'TỐT','PM01')
insert into MAYTINH values ('M09',N'MÁY 09','2018-05-13',N'TỐT','PM01')
insert into MAYTINH values ('M010',N'MÁY 10','2018-05-13',N'TỐT','PM01')
insert into MAYTINH values ('M011',N'MÁY 11','2018-05-13',N'TỐT','PM01')
insert into MAYTINH values ('M012',N'MÁY 12','2018-05-13',N'TỐT','PM02')
insert into MAYTINH values ('M013',N'MÁY 13','2018-05-13',N'TỐT','PM02')
insert into MAYTINH values ('M014',N'MÁY 14','2018-05-13',N'TỐT','PM02')
insert into MAYTINH values ('M015',N'MÁY 15','2018-05-13',N'TỐT','PM02')
insert into MAYTINH values ('M016',N'MÁY 16','2018-05-13',N'TỐT','PM02')
insert into MAYTINH values ('M017',N'MÁY 17','2018-05-13',N'TỐT','PM02')
insert into MAYTINH values ('M018',N'MÁY 18','2018-05-13',N'LỖI PHẦN MỀM','PM02')
insert into MAYTINH values ('M019',N'MÁY 19','2018-05-13',N'LỖI PHẦN MỀM','PM02')
insert into MAYTINH values ('M020',N'MÁY 20','2018-05-13',N'LỖI PHẦN MỀM','PM02')

--NHANVIEN--
INSERT INTO NHANVIEN
VALUES('NV01',N'Nguyễn Thị Trang','1987-4-4',N'Nữ',N'Hà Nội','PM01')
INSERT INTO NHANVIEN
VALUES('NV02',N'Nguyễn Thanh Thảo','1987-11-1',N'Nữ',N'Hà Nội','PM02')
INSERT INTO NHANVIEN
VALUES('NV03',N'Trần Lâm Huỳnh','1977-10-1',N'Nam',N'Hà Tĩnh','PM02')

--LOPHOCPHAN--
INSERT INTO LOPHOCPHAN
VALUES('LHP01','KL1',N'Thực Tập Kỹ Thuật Lập Trình')
INSERT INTO LOPHOCPHAN
VALUES('LHP02','KL2',N'Thực Tập Kỹ Thuật Lập Trình')
INSERT INTO LOPHOCPHAN
VALUES('LHP03','KL3',N'Thực Tập Kỹ Thuật Lập Trình')
INSERT INTO LOPHOCPHAN
VALUES('LHP04','KL4',N'Thực Tập Kỹ Thuật Lập Trình')
INSERT INTO LOPHOCPHAN
VALUES('LHP05','CD1',N'Thực Tập Cơ Sở Dữ Liệu')
INSERT INTO LOPHOCPHAN
VALUES('LHP06','CD2',N'Thực Tập Cơ Sở Dữ Liệu')
INSERT INTO LOPHOCPHAN
VALUES('LHP07','CD3',N'Thực Tập Cơ Sở Dữ Liệu')
INSERT INTO LOPHOCPHAN
VALUES('LHP08','CD4',N'Thực Tập Cơ Sở Dữ Liệu')
INSERT INTO LOPHOCPHAN
VALUES('LHP09','IT1',N'Thực Tập Công Nghệ Thông Tin')
INSERT INTO LOPHOCPHAN
VALUES('LHP10','IT2',N'Thực Tập Công Nghệ Thông Tin')
INSERT INTO LOPHOCPHAN
VALUES('LHP11','IT3',N'Thực Tập Công Nghệ Thông Tin')
INSERT INTO LOPHOCPHAN
VALUES('LHP12','IT4',N'Thực Tập Công Nghệ Thông Tin')
INSERT INTO LOPHOCPHAN
VALUES('LHP13','NN11',N'Ngôn Ngữ Lập Trình 1')
INSERT INTO LOPHOCPHAN
VALUES('LHP14','NN12',N'Ngôn Ngữ Lập Trình 1')
INSERT INTO LOPHOCPHAN
VALUES('LHP15','NN13',N'Ngôn Ngữ Lập Trình 1')
INSERT INTO LOPHOCPHAN
VALUES('LHP16','NN14',N'Ngôn Ngữ Lập Trình 1')
INSERT INTO LOPHOCPHAN
VALUES('LHP17','NN21',N'Ngôn Ngữ Lập Trình 2')
INSERT INTO LOPHOCPHAN
VALUES('LHP18','NN22',N'Ngôn Ngữ Lập Trình 2')
INSERT INTO LOPHOCPHAN
VALUES('LHP19','NN23','Ngon Ngu Lap Trinh 2')
INSERT INTO LOPHOCPHAN
VALUES('LHP20','NN24','Ngon Ngu Lap Trinh 2')

--SINHVIEN--
INSERT INTO SINHVIEN
VALUES('SV01',N'Nguyễn Thị Nhạn','1998-4-20',N'Nữ',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV02',N'Nguyễn Đức Trung','1997-12-1',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV03',N'Nguyễn Sỹ Hoài Nam','1995-3-22',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV04',N'Trịnh Minh Vũ','1995-10-22',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV05',N'Phạm Tiến Dũng','1998-9-9',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV06',N'Trương Nhật Minh','1997-4-4',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV07',N'Nguyễn Thanh Tùng','1997-11-1',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV08',N'Phạm Văn Khánh','1993-12-1',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV09',N'Hoàng Ngọc Kim Oanh','1994-12-1',N'Nữ',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV10',N'Nghiêm Thu Huyền','1993-2-4',N'Nữ',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV11',N'Nguyễn Hải Thanh','1992-12-12',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV12',N'Vũ Mỹ Dung','1992-7-7',N'Nữ',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV13',N'Nguyễn Mạnh Hùng','1994-12-11',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV14',N'Phạm Việt Hùng','1997-11-12',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV15',N'Hoàng Văn Toàn','1999-12-10',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV16',N'Lù Thị Yên','1997-10-10',N'Nữ',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV17',N'Mai Quang Dũng','1999-3-3',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV18',N'Nguyễn Anh Tuấn','1999-6-12',N'Nam',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV19',N'Trần Hồng Minh','1999-9-8',N'Nữ',N'Hà Nội')
INSERT INTO SINHVIEN
VALUES('SV20',N'Bùi Thị Lịch','1994-10-10',N'Nữ',N'Hà Nội')

----Sua Thong Tin Sinh Vien----
UPDATE SINHVIEN
SET diachiSV=N'Bắc Ninh'
WHERE hotenSV=N'Nguyễn Thị Nhạn'
UPDATE SINHVIEN
SET diachiSV=N'Hải Dương'
WHERE hotenSV=N'Phạm Tiến Dũng'
UPDATE SINHVIEN
SET diachiSV=N'Hà Giang'
WHERE hotenSV=N'Hoàng Văn Toàn'
UPDATE SINHVIEN
SET diachiSV=N'Hà Giang'
WHERE hotenSV=N'Lù Thị Yên'
UPDATE SINHVIEN
SET diachiSV=N'Nghệ An'
WHERE hotenSV=N'Bùi Thị Lịch'
UPDATE SINHVIEN
SET diachiSV=N'Mộc Châu'
WHERE hotenSV=N'Mai Quang Dũng'
--GIAOVIEN--
INSERT INTO GIAOVIEN
VALUES('GV01',N'Nguyễn Tuấn Anh','1988-4-20',N'Nam',N'Hà Nội')
INSERT INTO GIAOVIEN
VALUES('GV02',N'Trần Thành Đạt','1985-12-1',N'Nam',N'Hà Nội')
INSERT INTO GIAOVIEN
VALUES('GV03',N'Phạm Văn Hoàng','1985-3-22',N'Nam',N'Hà Nội')
INSERT INTO GIAOVIEN
VALUES('GV04',N'Nguyễn Tiến Thành','1984-10-22',N'Nam',N'Hà Nội')
INSERT INTO GIAOVIEN
VALUES('GV05',N'Nguyễn Thế Vũ','1998-9-9',N'Nam',N'Ninh Bình')
INSERT INTO GIAOVIEN
VALUES('GV06',N'Phan Ngọc Huy','1987-4-4',N'Nam',N'Hà Nội')
INSERT INTO GIAOVIEN
VALUES('GV07',N'Đinh Thu Trà','1987-9-4',N'Nữ',N'Hà Nội')
--CT_HOCPHAN--
INSERT INTO CT_HOCPHAN
VALUES ('LHP01','GV01','SV01','KL1',N'Nguyễn Tuấn Anh',N'Nguyễn Thị Nhạn')
INSERT INTO CT_HOCPHAN
VALUES ('LHP01','GV01','SV02','KL1',N'Nguyễn Tuấn Anh',N'Nguyễn Đức Trung')
INSERT INTO CT_HOCPHAN
VALUES ('LHP01','GV01','SV03','KL1',N'Nguyễn Tuấn Anh',N'Nguyễn Sỹ Hoài Nam')
INSERT INTO CT_HOCPHAN
VALUES ('LHP01','GV01','SV04','KL1',N'Nguyễn Tuấn Anh',N'Trịnh Minh Vũ')
INSERT INTO CT_HOCPHAN
VALUES ('LHP01','GV01','SV05','KL1',N'Nguyễn Tuấn Anh',N'Phạm Tiến Dũng')
INSERT INTO CT_HOCPHAN
VALUES ('LHP02','GV02','SV06','KL2',N'Trần Thành Đạt',N'Trương Nhật Minh')
INSERT INTO CT_HOCPHAN
VALUES ('LHP02','GV02','SV07','KL2',N'Trần Thành Đạt',N'Nguyễn Thanh Tùng')
INSERT INTO CT_HOCPHAN
VALUES ('LHP02','GV02','SV08','KL2',N'Trần Thành Đạt',N'Phạm Văn Khánh')
INSERT INTO CT_HOCPHAN
VALUES ('LHP02','GV02','SV09','KL2',N'Trần Thành Đạt',N'Hoàng Ngọc Kim Oanh')
INSERT INTO CT_HOCPHAN
VALUES ('LHP02','GV02','SV10','KL2',N'Trần Thành Đạt',N'Nghiêm Thu Huyền')
INSERT INTO CT_HOCPHAN
VALUES ('LHP05','GV03','SV01','CD1',N'Phạm Văn Hoàng',N'Nguyễn Thị Nhạn')
INSERT INTO CT_HOCPHAN
VALUES ('LHP05','GV03','SV03','CD1',N'Phạm Văn Hoàng',N'Nguyễn Sỹ Hoài Nam')
INSERT INTO CT_HOCPHAN
VALUES ('LHP05','GV03','SV05','CD1',N'Phạm Văn Hoàng',N'Phạm Tiến Dũng')
INSERT INTO CT_HOCPHAN
VALUES ('LHP05','GV03','SV07','CD1',N'Phạm Văn Hoàng',N'Nguyễn Thanh Tùng')
INSERT INTO CT_HOCPHAN
VALUES ('LHP05','GV03','SV09','CD1',N'Phạm Văn Hoàng',N'Hoàng Ngọc Kim Oanh')

--LICHTHUCHANH--
INSERT INTO LICHTHUCHANH 
values('TH1','2020-4-4',N'Bài Tập Thực Hành 1')
INSERT INTO LICHTHUCHANH 
values('TH2','2020-4-4',N'Bài Tập Thực Hành 2')
INSERT INTO LICHTHUCHANH 
values('TH3','2020-4-4',N'Bài Tập Thực Hành 3')


 
--CT_THUCHANH--
INSERT INTO CT_THUCHANH 
values('TH1','NV01','GV01','2020-4-4',N'Nuyễn Thị Trang',N'Nguyễn Tuấn Anh','Ca 1','07:00:00','09:30:00')
INSERT INTO CT_THUCHANH 
values('TH2','NV01','GV02','2020-4-5',N'Nuyễn Thị Trang',N'Trần Thành Đạt','Ca 1','07:00:00','09:30:00')
INSERT INTO CT_THUCHANH 
values('TH3','NV02','GV03','2020-4-4',N'Nguyễn Thanh Thảo',N'Phạm Văn Hoàng','Ca 2','09:30:00','12:00:00')




---------------------------------------------------------------------------------------------
---KHAI THAC DU LIEU---
----Nguyễn Đức Trung----
--In ra nhung sinh vien den tu HN--
SELECT* FROM SINHVIEN WHERE diachiSV =N'Hà Nội'
--In ra nhung sinh vien hoc lop Ky thuat lap trinh KL1--
SELECT SINHVIEN.hotenSV FROM SINHVIEN,CT_HOCPHAN,LOPHOCPHAN
WHERE CT_HOCPHAN.maLHP = LOPHOCPHAN.maLHP AND LOPHOCPHAN.tenLHP = 'KL1' AND  CT_HOCPHAN.maSV = SINHVIEN.maSV
--In ra nhung sinh vien hoc lop hoc cua hoc sinh ten Nguyen Thi Nhan--
SELECT LOPHOCPHAN.tenLHP,LOPHOCPHAN.tenHP FROM SINHVIEN,CT_HOCPHAN,LOPHOCPHAN
WHERE CT_HOCPHAN.maLHP = LOPHOCPHAN.maLHP AND CT_HOCPHAN.maSV = SINHVIEN.maSV AND SINHVIEN.hotenSV = N'Nguyễn Thị Nhạn'
--In ra man hinh nhung sinh vien co lich thuc hanh Ca 2--
SELECT SINHVIEN.hotenSV FROM SINHVIEN,CT_HOCPHAN,GIAOVIEN, CT_THUCHANH
WHERE SINHVIEN.maSV = CT_HOCPHAN.maSV AND CT_HOCPHAN.maGV = GIAOVIEN.maGV AND GIAOVIEN.maGV = CT_THUCHANH.maGV AND CT_THUCHANH.ca = 'Ca 2'
--In ra man hinh so luong sinh vien thuc hanh Ca 1--
SELECT Count(SINHVIEN.hotenSV) AS "Số lượng sinh viên" FROM SINHVIEN,CT_HOCPHAN,GIAOVIEN, CT_THUCHANH
WHERE SINHVIEN.maSV = CT_HOCPHAN.maSV AND CT_HOCPHAN.maGV = GIAOVIEN.maGV AND GIAOVIEN.maGV = CT_THUCHANH.maGV AND CT_THUCHANH.ca = 'Ca 1'
--In ra số sinh viên thực hành cả 2 Ca--
SELECT SINHVIEN.hotenSV FROM SINHVIEN,CT_HOCPHAN,GIAOVIEN, CT_THUCHANH
WHERE SINHVIEN.maSV = CT_HOCPHAN.maSV AND CT_HOCPHAN.maGV = GIAOVIEN.maGV AND GIAOVIEN.maGV = CT_THUCHANH.maGV AND CT_THUCHANH.ca = 'Ca 2'  AND CT_LICHTHUCHANH.ca = 'Ca 1'

----Trần Thành Đạt----


----Đinh Tiến Dũng----
--In ra những máy tính và tình trạng máy ở Phòng máy 1=--
SELECT MAYTINH.tenMT,MAYTINH.tinhtrang FROM MAYTINH,PHONGMAY
WHERE PHONGMAY.maPM = MAYTINH.maPM and MAYTINH.maPM ='PM01'
--In ra những máy tính bị lỗi phần mềm--
SELECT MAYTINH.maMT, MAYTINH.tenMT FROM MAYTINH
WHERE MAYTINH.tinhtrang = N'LỖI PHẦN MỀM'
--Đếm số lượng máy tính tình trạng TỐT ở Phòng máy 2--
SELECT Count(MAYTINH.maMT) AS "Số lượng máy tốt"  FROM MAYTINH,PHONGMAY
WHERE MAYTINH.tinhtrang = N'TỐT' AND MAYTINH.maPM ='PM02' AND MAYTINH.maPM=PHONGMAY.maPM
-----------------------------------------------

--------------View------------------
----Nguyễn Đức Trung----
--Tạo View xem những sinh viên học môn "TT Kỹ thuật lập trình"--
create view SVKL AS
SELECT SINHVIEN.hotenSV AS "Sinh viên học môn TTKTLT" FROM SINHVIEN,CT_HOCPHAN,LOPHOCPHAN
WHERE SINHVIEN.maSV = CT_HOCPHAN.MASV AND  CT_HOCPHAN.maLHP = LOPHOCPHAN.maLHP AND LOPHOCPHAN.tenHP = N'Thực Tập Kỹ Thuật Lập Trình'
go
select * from SVKL

drop view SVKL
--Tạo View xem số lượng sinh viên học môn "TT Cơ sở dữ liệu"--
create view SVCD AS
SELECT Count(SINHVIEN.maSV) AS "Số lượng sinh viên học TTCSDL"  FROM SINHVIEN,CT_HOCPHAN,LOPHOCPHAN
WHERE SINHVIEN.maSV = CT_HOCPHAN.MASV AND  CT_HOCPHAN.maLHP = LOPHOCPHAN.maLHP AND LOPHOCPHAN.tenHP = N'Thực Tập Cơ Sở Dữ Liệu'
go
select * from SVCD

drop view SVCD
--Tạo View xem thông tin những lớp đã có học sinh đăng ký học--
create view DSL AS
SELECT LOPHOCPHAN.maLHP, LOPHOCPHAN.tenHP, LOPHOCPHAN.tenLHP FROM LOPHOCPHAN, CT_HOCPHAN
WHERE LOPHOCPHAN.maLHP = CT_HOCPHAN.maLHP AND CT_HOCPHAN.maSV IS not NULL
go
select * from DSL

drop view DSL

----Trần Thành Đạt----
--Tạo view xem nội dụng ca 1 lịch thực hành--
CREATE VIEW noidungthuchanh_ca1
AS
SELECT LTH.noidungTH as N'Nội dung',CT.ca as N'Ca thực hành'
FROM LICHTHUCHANH as LTH, CT_THUCHANH as CT
WHERE CT.maLTH=LTH.maLTH and CT.ca = 'Ca 1'
GO 
SELECT * FROM noidungthuchanh_ca1

DROP VIEW noidungthuchanh_ca1
--d--


----Đinh Tiến Dũng----
--TẠO VIEW XEM SỐ LƯỢNG TẤT CẢ MÁY TÍNH TÌNH TRẠNG TỐT--
create view SOLUONGMAYTOT AS
SELECT Count(MAYTINH.maMT) AS "Số lượng máy tốt" FROM MAYTINH
WHERE MAYTINH.tinhtrang = N'TỐT'
go
select * from SOLUONGMAYTOT

drop view SOLUONGMAYTOT

--TẠO VIEW XEM SỐ LƯỢNG TẤT CẢ MÁY TÍNH TÌNH TRẠNG MÁY PHÒNG 2--
create view MAYPHONG2 AS
SELECT MAYTINH.tenMT,MAYTINH.tinhtrang FROM MAYTINH,PHONGMAY
WHERE PHONGMAY.maPM = MAYTINH.maPM and MAYTINH.maPM ='PM02'
go
select * from MAYPHONG2

drop view MAYPHONG2
--TẠO VIEW XEM THÔNG TIN NHỮNG MÁY NHẬP NGÀY 13/5/2018--
create view MAYNHAP AS
SELECT MAYTINH.maMT,MAYTINH.tenMT,MAYTINH.tinhtrang FROM MAYTINH
WHERE MAYTINH.ngaynhap= '2018-05-13'
go
select * from MAYNHAP

drop view MAYNHAP
------------------------------------
/*T-SQL*/
----Nguyễn Đức Trung----
--Thủ tục xem thông tin sinh viên theo MSV--
create proc Xem_SV_Theo_MaSV
@maSV varchar(30)
as select * from SINHVIEN
WHERE maSV =@maSV

Xem_SV_Theo_MaSV SV01

drop proc Xem_SV_Theo_MaSV 

--Thủ tục xem sinh viên--
create proc Them_SV
@maSV varchar(30),
@hotenSV nvarchar(30),
@ngaysinhSV date,
@gioitinhSV nvarchar(10),
@diachiSV nvarchar(30)
as
insert into SINHVIEN values(@maSV,@hotenSV,@ngaysinhSV,@gioitinhSV,@diachiSV)

Them_SV SV21,N'Ngô Hoàng Việt','1998-3-2','Nam',N'Hà Nội'

drop proc Them_SV

--Xem số lượng sinh viên theo môn học--
create proc soluongsinhvien
@maLHP varchar(30)
as
select count(SINHVIEN.maSV) as 'Số lượng sinh viên' from SINHVIEN, CT_HOCPHAN
where SINHVIEN.maSV = CT_HOCPHAN.maSV and CT_HOCPHAN.maLHP = @maLHP

soluongsinhvien LHP05

drop proc soluongsinhvien
----Trần Thành Đạt----

----Đinh Tiến Dũng----
---Xem thông tin máy tính theo phòng---
create proc Xem_MT_Theo_Phong
@maPM varchar(30)
AS
SELECT* FROM MAYTINH,PHONGMAY
WHERE MAYTINH.maPM=PHONGMAY.maPM and PHONGMAY.maPM=@maPM
Xem_MT_Theo_Phong PM02
drop proc Xem_MT_Theo_Phong
--Thêm máy tính--
create proc Them_MT
    @maMT varchar(30),
	@tenMT nvarchar(30),
	@ngaynhap date,
	@tinhtrang nvarchar(30),
	@maPM varchar(30)
	as
insert into MAYTINH values(@maMT,@tenMT,@ngaynhap,@tinhtrang,@maPM)
Them_MT 'M30',N'MÁY 30','2020-3-3',N'TỐT','PM02'
drop proc Them_MT
--Xem thông tin máy nhập năm thời gian--
create proc xem_may_theo_time
@ngaynhap date 
as
select* from MAYTINH
where MAYTINH.ngaynhap=@ngaynhap 
xem_may_theo_time '2018-05-13'
drop proc xem_may_theo_time
/*DROP DATABASE*/
use master
drop database QLPhongMay