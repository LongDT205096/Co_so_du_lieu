CREATE TABLE GiangVien(
	"GV#" char(6) PRIMARY KEY,
	HoTen nvarchar(30) NOT NULL,
	NamSinh int NOT NULL,
	DiaChi nvarchar(50) NOT NULL
);

CREATE TABLE DeTai(
	"DT#" char(6) PRIMARY KEY,
	TenDT nvarchar(50),
	TheLoai nvarchar(20)
);

CREATE TABLE SinhVien(
	"SV#" char(6) PRIMARY KEY,
	TenSV nvarchar(30),
	NgaySinh date,
	QueQuan nvarchar(20),
	Lop char(20),
);

CREATE TABLE HuongDan(
	"GV#" char(6),
	"DT#" char(6),
	"SV#" char(6),
	NamThucHien int,
	KetQua float,
	PRIMARY KEY("GV#", "DT#", "SV#"),
	CONSTRAINT fk_gv FOREIGN KEY ("GV#") REFERENCES GiangVien,
	CONSTRAINT fk_sv FOREIGN KEY ("SV#") REFERENCES SinhVien,
	CONSTRAINT fk_dt FOREIGN KEY ("DT#") REFERENCES DeTai
);

INSERT INTO GiangVien ("GV#", HoTen, NamSinh, DiaChi) VALUES
('GV001', N'Vũ Tuyết Trinh', 1975, N'Hoàng Mai, Hà Nội'),
('GV002', N'Nguyễn Nhật Quang', 1976, N'Hai Bà Trưng, Hà Nội'),
('GV003', N'Trần Đức Khánh', 1977, N'Đống Đa, Hà Nội'),
('GV004', N'Nguyễn Hồng Phương', 1983, N'Tây Hồ, Hà Nội'),
('GV005', N'Lê Thanh Hương', 1976, N'Hai Bà Trưng, Hà Nội'),
('GV006', N'Lương Dũng Trí', 1975, N'Đống Đa, Hà Nội'),
('GV007', N'Nguyễn Anh Khải', 1980, N'Quận 6, Hồ Chí Minh'),
('GV008', N'Nguyễn Xuân Bình', 1986, N'Vũng Tàu'),
('GV009', N'Võ Khánh An', 1973, N'Hải Châu, Đà Nẵng'),
('GV010', N'Võ Trung Hải', 1978, N'Tân An, Long An')

INSERT INTO SinhVien ("SV#", TenSV, NgaySinh, QueQuan, Lop) VALUES
('SV001', N'Thịnh Nam Dương', '2000/2/21', N'Hà Nội', 'VN001'),
('SV002', N'Nguyễn Xuân Dũng', '2000/6/26', N'Hà Nam', 'VN002'),
('SV003', N'Nguyễn Văn Nam', '2000/8/28', N'Bắc Giang', 'VN004'),
('SV004', N'Nông Văn Dền', '2002/7/16', N'Hồ Chí Minh', 'VN006'),
('SV005', N'Nguyễn Tuấn Tú', '2001/3/24', N'Long An', 'VN001'),
('SV006', N'Hoàng Ðức Tài', '1998/6/12', N'Cần Thơ', 'VN005'),
('SV007', N'Phạm Trường Chinh', '1999/5/19', N'Nam Định', 'VN002'),
('SV008', N'Nguyễn Tân Thành', '1999/2/9', N'Bình Dương', 'VN003'),
('SV009', N'Phan Ðình Nam', '2000/7/2', N'Thái Bình', 'VN004'),
('SV010', N'Hồ Quang Hùng', '1999/11/6', N'Bắc Giang', 'VN005'),
('SV011', N'Nguyễn Duy Tân', '2003/2/7', N'Nghệ An', 'VN002'),
('SV012', N'Vũ Gia Kiệt', '2000/7/19', N'Đà Nẵng', 'VN001'),
('SV013', N'Phạm Trọng Hà', '2001/9/20', N'Quảng Ninh', 'VN003'),
('SV014', N'Dương Thế Dũng', '2003/2/1', N'Hải Phòng', 'VN006'),
('SV015', N'Nguyễn Tấn Nam', '2004/12/31', N'Hưng Yên', 'VN005'),
('SV016', N'Nguyễn Quang Tuấn', '2002/02/22', N'Hải Phòng', 'VN004')

INSERT INTO DeTai("DT#", TenDT, TheLoai) VALUES
('DT001', N'Tính toán lưới', N'Toán ứng dụng'),
('DT002', N'Phát hiện tri thức', N'Ứng dụng' ),
('DT003', N'Phân loại văn bản', N'Ứng dụng'),
('DT004', N'Dịch tự động Anh Việt', N'Ngôn ngữ'),
('DT005', N'Tái sử dụng rác thải trong học đường', N'Xã hội'),
('DT006', N'Trang phục sức thời Lý-Trần', N'Lịch sử'),
('DT007', N'Ứng dụng Big Data trong hoạt động Marketing', N'Ứng dụng'),
('DT008', N'Xây dựng mô hình mô phỏng dự báo phát triển đô thị', N'Kinh tế'),
('DT009', N'Giải pháp giảm bất ổn kinh tế vĩ mô ở Việt Nam', N'Kinh tế'),
('DT010', N'Hệ thống hỗ trợ giữ xe thông minh', N'Ứng dụng')
('DT011', N'Hệ thống camera cửa hàng', N'Ứng dụng')

INSERT INTO HuongDan("GV#", "DT#", "SV#", NamThucHien, KetQua) VALUES
('GV001', 'DT001', 'SV003', 2019, 9),
('GV001', 'DT002', 'SV002', 2022, 6.5),
('GV006', 'DT003', 'SV003', 2021, 8),
('GV002', 'DT001', 'SV002', 2019, 7),
('GV007', 'DT003', 'SV011', 2022, 6),
('GV003', 'DT003', 'SV001', 2020, 6),
('GV004', 'DT004', 'SV014', 2020, 9),
('GV010', 'DT008', 'SV007', 2019, 10),
('GV009', 'DT006', 'SV013', 2021, 9.5),
('GV002', 'DT008', 'SV010', 2022, 7.5),
('GV008', 'DT009', 'SV009', 2019, 8.5),
('GV005', 'DT004', 'SV004', 2021, 9),
('GV010', 'DT005', 'SV005', 2022, 7),
('GV005', 'DT007', 'SV008', 2019, 8),
('GV006', 'DT010', 'SV012', 2020, 9.5),
('GV008', 'DT006', 'SV005', 2019, 10),
('GV007', 'DT005', 'SV001', 2021, 8.5),
('GV012', 'DT009', 'SV014', 2021, 9),
('GV012', 'DT010', 'SV016', 2022, 10)


--Task2
Select * from GiangVien 
where "GV#" = 'GV001'

select * from DeTai 
where TheLoai = N'Ứng dụng'

select gv."GV#", gv.HoTen, sv."SV#", sv.TenSV, sv.Lop, sv.QueQuan from HuongDan hd
join SinhVien sv on  hd."SV#" = sv."SV#"
join GiangVien gv on gv."GV#" = hd."GV#"
where hd."GV#" = 'GV012' and sv.QueQuan = N'Hải Phòng'

select dt."DT#", TenDT from DeTai dt 
where dt."DT#" not in
(select hd."DT#" from HuongDan hd
group by hd."DT#")

update SinhVien 
set NgaySinh = '1991/11/12'
where TenSV = N'Nguyễn Xuân Dũng' and QueQuan = N'Hà Nam'

alter table HuongDan
	drop constraint fk_sv
delete from SinhVien 
where TenSV = N'Nguyễn Văn Nam' and QueQuan = N'Bắc Giang'

create view find_detaihd as
select gv."GV#", gv.HoTen, dt."DT#", dt.TenDT from HuongDan hd
join GiangVien gv on hd."GV#" = gv."GV#"
join DeTai dt on hd."DT#"  = dt."DT#"

--task3
BACKUP DATABASE QLKH
TO DISK = 'D:\backups\QLKH.bak';

--task4
create login ThuyNV with password = 'thuy123'
create login QuanTL with password = 'quan123'
