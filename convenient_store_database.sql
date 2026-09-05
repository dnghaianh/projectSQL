/*
create table KhachHang (
KhachHangID INT primary key identity(1,1),
HoTen nvarchar(50),
Email varchar(200),
SDT varchar(20),
DiaChi nvarchar(max));

CREATE TABLE MatHang (
MatHangID INT PRIMARY KEY IDENTITY(1,1),
TenMatHang NVARCHAR(30) NOT NULL,
MieuTa nvarchar(200)
);

CREATE TABLE TrangThai (
TrangThaiID int PRIMARY KEY identity(1,1),
TenTrangThai nvarchar(50) 
);

create table ChiNhanh (
ChiNhanhID INT primary key identity(1,1),
DiaChi nvarchar(300));

create table NhanVien (
NhanVienID INT primary key identity(1,1),
TenNV nvarchar(200),
ChiNhanhID int
foreign key (ChiNhanhID) references ChiNhanh(ChiNhanhID)
);

create table CungCap (
NhaCungCapID INT primary key identity(1,1),
TenNhaCungCap nvarchar(200)
);

Create table DonHang(
DonHangID INT primary key identity(1,1),
NhanVienID INT
foreign key (NhanVienID) references NhanVien(NhanVienID),
KhachHangID INT,
foreign key (KhachHangID) references Khachhang(KhachHangID),
NgayDat Date,
TongTienDon INT,
ChiNhanhID int
foreign key (ChiNhanhID) references ChiNhanh(ChiNhanhID),
TrangThaiID int,
foreign key (TrangThaiID) references TrangThai(TrangThaiID));

Create table SanPham(
SanPhamID INT primary key identity(1,1),
MatHangID INT,
foreign key (MatHangID) references MatHang(MatHangID),
TenSanPham nvarchar(30),
GiaCa decimal(18,2),
NhaCungCapID int
foreign key (NhaCungCapID) references CungCap(NhaCungCapID)
);

create table KhuyenMai (
GiamGiaID int primary key identity(1,1),
TenChuongTrinh nvarchar(200),
DonToiThieu int,
GiamDuoc decimal(18,2));

create table SPKhuyenMai (
SPKMID int primary key identity (1,1),
SanPhamID int
foreign key (SanPhamID) references SanPham(SanPhamID),
DangKM bit default 1,
GiamGiaID int
foreign key (GiamGiaID) references KhuyenMai(GiamGiaID)
);

CREATE TABLE ChiTietDH (
ChiTietDH INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
SanPhamID INT,
Soluong INT,
GiamGiaID int
foreign key (GiamGiaID) references KhuyenMai(GiamGiaID),
DonGiaSP DECIMAL(18,2) NOT NULL,
DaGiam decimal(18,2) default 0,
DonHangID INT NOT NULL, 
FOREIGN KEY (DonHangID) REFERENCES DonHang(DonhangID),
FOREIGN KEY (SanPhamID) REFERENCES SanPham(SanPhamID) 
);

create table HangTonKho(
HangTonID int primary key identity(1,1),
ChiNhanhID int
foreign key (ChiNhanhID) references ChiNhanh(ChiNhanhID),
MatHangID int
foreign key (MatHangID) references MatHang(MatHangID),
TonLai int);

create table TraHang (
TraHangID int primary key identity(1,1),
DonHangID int
foreign key (DonHangID) references DonHang(DonHangID),
KhachHangID int
foreign key (KhachHangID) references KhachHang(KhachHangID),
LiDo nvarchar(300)
);

create table NhapHang(
NhapHangID int primary key identity(1,1),
SanPhamID int
foreign key (SanPhamID) references SanPham(SanPhamID),
SoLuongNhap int,
TienNhap decimal (18,2),
NgayNhap datetime,
NhaCungCapID int
foreign key (NhaCungCapID) references CungCap(NhaCungCapID)
);

create table ThanhToanChoNCC (
DonHangThanhToanID int primary key identity (1,1),
NhaCungCapID int
foreign key (NhaCungCapID) references CungCap(NhaCungCapID),
TrangThaiTT nvarchar(100),
SoTienTT decimal(18,2) default 0,
TraVaoNgay DateTime,
NhapHangID int
foreign key (NhapHangID) references NhapHang(NhapHangID));
*/
/*
-- 1. KhachHang
INSERT INTO KhachHang (HoTen, Email, SDT, DiaChi)
VALUES
(N'Nguyễn Văn An', 'an.nguyen@gmail.com', '0901000001', N'Quận 1, TP.HCM'),
(N'Trần Thị Bình', 'binh.tran@gmail.com', '0901000002', N'Quận 3, TP.HCM'),
(N'Lê Minh Tuấn', 'tuan.le@gmail.com', '0901000003', N'Quận 7, TP.HCM'),
(N'Phạm Thu Hà', 'ha.pham@gmail.com', '0901000004', N'Bình Thạnh, TP.HCM'),
(N'Võ Hoàng Nam', 'nam.vo@gmail.com', '0901000005', N'Tân Bình, TP.HCM'),
(N'Đặng Quốc Bảo','bao@gmail.com','0901000006',N'Quận 10, TP.HCM'),
(N'Ngô Thanh Huy','huy@gmail.com','0901000007',N'Gò Vấp, TP.HCM'),
(N'Hoàng Mai Anh','maianh@gmail.com','0901000008',N'Thủ Đức, TP.HCM'),
(N'Bùi Minh Khang','khang@gmail.com','0901000009',N'Quận 8, TP.HCM'),
(N'Đỗ Thu Trang','trang@gmail.com','0901000010',N'Phú Nhuận, TP.HCM');


-- 2. MatHang
INSERT INTO MatHang (TenMatHang, MieuTa)
VALUES
(N'Đồ uống', 'Nước ngọt, nước suối, cà phê'),
(N'Thực phẩm khô', 'Mì gói, bánh kẹo, đồ ăn nhanh'),
(N'Sữa và sản phẩm từ sữa', 'Sữa tươi, sữa chua'),
(N'Đồ gia dụng', 'Khăn giấy, vật dụng cá nhân'),
(N'Thực phẩm đông lạnh', 'Xúc xích, kem, đồ đông lạnh');


-- 3. TrangThai
INSERT INTO TrangThai (TenTrangThai)
VALUES
(N'Đã thanh toán'),
(N'Đang xử lý'),
(N'Đã giao'),
(N'Đã hủy');


-- 4. ChiNhanh
INSERT INTO ChiNhanh (DiaChi)
VALUES
(N'123 Nguyễn Huệ, Quận 1, TP.HCM'),
(N'45 Lê Văn Sỹ, Quận 3, TP.HCM'),
(N'78 Nguyễn Văn Cừ, Quận 5, TP.HCM');


-- 5. NhanVien
INSERT INTO NhanVien (TenNV, ChiNhanhID)
VALUES
(N'Nguyễn Thị Lan',1),
(N'Trần Văn Hùng',1),
(N'Lê Hoàng Phúc',2),
(N'Phạm Ngọc Mai',2),
(N'Võ Thanh Tùng',3),
(N'Nguyễn Hải Đăng',1),
(N'Trần Minh Đức',2),
(N'Lý Thanh Sơn',3);


-- 6. CungCap
INSERT INTO CungCap (TenNhaCungCap)
VALUES
(N'Công ty Vinamilk'),
(N'Công ty Pepsi Việt Nam'),
(N'Công ty Acecook Việt Nam'),
(N'Công ty Orion Việt Nam'),
(N'Công ty Unilever Việt Nam');


-- 7. SanPham
INSERT INTO SanPham 
(MatHangID, TenSanPham, GiaCa, NhaCungCapID)
VALUES
(1,N'Nước suối Lavie 500ml',10000,2),
(1,N'Nước Pepsi lon',15000,2),
(2,N'Mì Hảo Hảo tôm chua cay',5000,3),
(2,N'Bánh ChocoPie',12000,4),
(3,N'Sữa tươi Vinamilk 180ml',8000,1),
(4,N'Khăn giấy Bless You',25000,5),
(5,N'Xúc xích CP',10000,5),
(1,N'Coca Cola lon',15000,2),
(2,N'Mì Modern',6000,3),
(3,N'Sữa Đặc ông thọ',40000,1),
(4,N'Nước rửa chén Sunlight',42000,5),
(5,N'Kem Merino',18000,5),
(1,N'Coca Cola lon',15000,2),
(2,N'Mì Modern',6000,3),
(5,N'Cá viên',75000,3),
(4,N'Nước rửa chén Sunlight',42000,5),
(5,N'Kem Merino',18000,5);



-- 8. KhuyenMai
INSERT INTO KhuyenMai
(TenChuongTrinh, DonToiThieu, GiamDuoc)
VALUES
(N'Khuyến mãi mùa hè',100000,10000),
(N'Giảm giá khách hàng mới',50000,5000),
(N'Giảm giá cuối tuần',200000,20000);


-- 9. SPKhuyenMai
INSERT INTO SPKhuyenMai
(SanPhamID, DangKM, GiamGiaID)
VALUES
(1,1,1),
(2,1,1),
(4,1,3),
(5,1,2);


-- 10. DonHang
INSERT INTO DonHang
(NhanVienID, KhachHangID, NgayDat, TongTienDon, ChiNhanhID, TrangThaiID)
VALUES
(1,1,'2026-01-01',50000,1,1),
(2,2,'2026-01-02',120000,1,3),
(3,3,'2026-01-03',80000,2,2),
(4,4,'2026-01-04',200000,2,1),
(5,5,'2026-01-05',150000,3,4),
(6,6,'2026-01-10',180000,1,1),
(1,3,'2026-04-05',420000,1,1),
(2,4,'2026-04-12',310000,1,2),
(3,5,'2026-04-19',95000,2,1),
(4,1,'2026-04-25',760000,2,4),
(5,2,'2026-05-03',210000,3,3),
(1,4,'2026-05-10',530000,1,1),
(2,5,'2026-05-18',390000,1,4),
(3,1,'2026-05-26',145000,2,1),
(4,2,'2026-06-04',880000,2,2),
(5,3,'2026-06-12',265000,3,1),
(1,5,'2026-06-20',175000,1,4),
(2,1,'2026-06-27',630000,1,1),
(3,2,'2026-07-06',470000,2,2),
(4,3,'2026-07-15',220000,2,1),
(5,4,'2026-07-24',910000,3,4),
(1,1,'2026-08-02',340000,1,1),
(2,2,'2026-08-11',560000,1,4),
(3,3,'2026-08-19',130000,2,1),
(4,4,'2026-08-27',680000,2,4),
(5,5,'2026-09-05',240000,3,3);



-- 11. ChiTietDH
INSERT INTO ChiTietDH
(SanPhamID, Soluong, GiamGiaID, DonGiaSP, DaGiam, DonHangID)
VALUES
(1,2,1,10000,5000,1),
(3,5,NULL,5000,0,1),
(2,3,1,15000,5000,2),
(4,2,3,12000,4000,3),
(5,4,2,8000,3000,4),
(7,5,NULL,10000,0,5),
(8,3,NULL,15000,0,6),
(9,5,NULL,6000,0,6),
(15,1,2,12000,2000,7),
(12,2,NULL,15000,0,8),
(6,4,1,25000,5000,9),
(17,3,NULL,5000,0,11),
(11,5,NULL,5000,0,13),
(14,2,NULL,12000,0,14),
(3,4,NULL,5000,0,16),
(8,2,NULL,15000,0,16),
(7,3,1,10000,3000,19),
(13,2,NULL,4500,0,19);


-- 12. HangTonKho
INSERT INTO HangTonKho
(ChiNhanhID, MatHangID, TonLai)
VALUES
(1,1,100),
(1,2,200),
(1,3,150),
(1,4,80),
(1,5,120),
(2,4,50),
(2,4,60),
(2,5,90),
(2,4,60),
(2,5,150),
(2,3,80),
(2,4,60),
(2,5,150),
(3,1,120),
(3,2,160),
(3,3,100),
(3,4,90),
(3,5,180),
(3,5,150);


-- 13. TraHang
INSERT INTO TraHang
(DonHangID, KhachHangID, LiDo)
VALUES
(3,3,N'Sản phẩm bị lỗi'),
(5,5,N'Khách đổi ý'),
(3,3,N'Sản phẩm bị lỗi bao bì'),

(5,5,N'Khách hàng đổi ý không muốn mua'),

(10,1,N'Sản phẩm hết hạn sử dụng'),

(12,4,N'Sai sản phẩm khi giao hàng'),

(16,2,N'Sản phẩm bị hư hỏng'),

(14,1,N'Không đúng nhu cầu sử dụng'),

(11,4,N'Sản phẩm lỗi kỹ thuật'),

(13,4,N'Bao bì bị móp');


-- 14. NhapHang
INSERT INTO NhapHang
(SanPhamID, SoLuongNhap, TienNhap, NgayNhap, NhaCungCapID)
VALUES
(1,100,800000,'2026-01-02',1),
(2,150,1200000,'2026-01-05',2),
(3,80,600000,'2026-01-10',3),
(4,200,1500000,'2026-01-15',4),
(5,120,950000,'2026-02-01',4),
(6,90,700000,'2026-02-08',2),
(7,150,1300000,'2026-02-15',5),
(8,70,500000,'2026-03-03',3),
(9,200,900000,'2026-03-10',5),
(10,100,1100000,'2026-03-20',1),
(11,60,450000,'2026-04-02',2),
(12,180,1600000,'2026-04-12',4),
(13,90,750000,'2026-04-20',5),
(14,130,1400000,'2026-05-05',3),
(15,50,400000,'2026-05-15',5),
(16,200,2000000,'2026-06-01',1),
(17,100,850000,'2026-06-10',2);



--15.ThanhToanChoNCC
INSERT INTO ThanhToanChoNCC
(NhaCungCapID, TrangThaiTT, SoTienTT, TraVaoNgay, NhapHangID)
VALUES
(1, N'Đã thanh toán', 800000,  '2026-01-12', 1),
(2, N'Đã thanh toán', 1200000, '2026-01-18', 2),
(3, N'Đã thanh toán', 600000,  '2026-01-22', 3),
(1, N'Đã thanh toán', 1500000, '2026-01-28', 4),
(4, N'Đã thanh toán', 950000,  '2026-02-12', 5),
(2, N'Đã thanh toán', 700000,  '2026-02-20', 6),
(5, N'Đã thanh toán', 1300000, '2026-02-27', 7),
(3, N'Đã thanh toán', 500000,  '2026-03-15', 8),
(1, N'Đã thanh toán', 900000,  '2026-03-22', 9),   
(1, N'Đã thanh toán', 1100000, '2026-04-02', 10),
(2, N'Đã thanh toán', 450000,  '2026-04-15', 11),
(4, N'Đã thanh toán', 1600000, '2026-04-25', 12),
(5, N'Đã thanh toán', 750000,  '2026-05-03', 13),
(3, N'Đã thanh toán', 1400000, '2026-05-18', 14),
(2, N'Đã thanh toán', 400000,  '2026-05-28', 15),  -- đã sửa từ NCC 6 -> 2
(1, N'Thanh toán một phần', 1200000, '2026-06-15', 16),  -- nợ lại 800,000
(2, N'Đã thanh toán', 850000,  '2026-06-25', 17);
*/

--Khách hàng mua sản phẩm gì.
select ka.HoTen, ka.KhachHangID, do.DonHangID, sa.TenSanPham
from KhachHang ka inner join DonHang do on ka.KhachHangID=do.KhachHangID inner join ChiTietDH ct on ct.DonHangID=do.DonHangID inner join SanPham sa on sa.SanPhamID=ct.SanPhamID;  

--Doanh thu theo danh mục.
select do.TongTienDon, ct.DonHangID from DonHang do inner join ChiTietDH ct on ct.DonHangID=do.DonHangID;

--Doanh thu theo chi nhánh.
select cn.ChiNhanhID, SUM(do.TongTienDon) as DoanhThuCN from ChiNhanh cn inner join DonHang do on do.ChiNhanhID=cn.ChiNhanhID group by cn.ChiNhanhID;

--Nhà cung cấp nào cung cấp nhiều sản phẩm nhất.
select cap.NhaCungCapID, cap.TenNhaCungCap, nhp.SoLuongNhap from CungCap cap inner join NhapHang nhp on nhp.NhaCungCapID=cap.NhaCungCapID order by nhp.SoLuongNhap desc;

--Khuyến mãi áp dụng cho sản phẩm nào.
select km.GiamDuoc,km.TenChuongTrinh, ct.ChiTietDH, ct.DonHangID from ChiTietDH ct inner join KhuyenMai km on ct.GiamGiaID=km.GiamGiaID;

--Thống kê số lượng sản phẩm của từng danh mục.
select TenMatHang, count(*) as SLSP from MatHang group by TenMatHang;

--Hiển thị những khách hàng đã mua hàng trên 10 lần.
select KhachHangID, count(*) as KhachMuaHon10L from DonHang group by KhachHangID having count(*) > 10;

--Tìm sản phẩm có giá cao hơn giá trung bình của toàn bộ sản phẩm. (subquery)
select GiaCa, TenSanPham, MatHangID from SanPham where GiaCa > (select AVG(GiaCa) from SanPham);

--Hiển thị khách hàng có tổng tiền đơn hàng cao nhất.
select kh.KhachHangID, kh.HoTen, dh.TongTienDon from DonHang dh inner join KhachHang kh on dh.KhachHangID=kh.KhachHangID where dh.TongTienDon=(select max(TongTienDon) from DonHang);

--hien thi khoang cach gia cua tung sp so voi sp lon nhat.
select TenSanPham, GiaCa, (select max(GiaCa) from SanPham) - GiaCa as KhoangCachGia from SanPham;


--Sử dụng CTE để tính doanh thu của từng tháng, sau đó lấy ra 3 tháng doanh thu cao nhất.
with BangTamDThu as 
(
select Month(NgayDat) as Thang , sum(TongTienDon) as DoanhThu
from DonHang group by Month(NgayDat)
)
select Thang, DoanhThu, dense_rank() over(order by DoanhThu desc) as DTCaoThang
from BangTamDThu;

--window function: Liệt kê 5 sản phẩm bán chạy nhất.
with TongTien as (
select SanPhamID, (SoLuong * DonGiaSP) as TongTienBanSP
from ChiTietDH )
select SanPhamID, TongTienBanSP, dense_rank() over(order by TongTienbanSP desc) as SPBanChayNhat
from TongTien;

--Đánh số thứ tự SL đơn hàng của từng khách hàng.
with DH as (
select KhachHangID, count(DonHangID) as DonHangTheoKH
from DonHang group by KhachHangID )
select KhachHangID,DonHangTheoKH, dense_rank() over(order by DonHangTheoKH desc) as XepHangDH from DH;

--Tạo VIEW hiển thị thông tin đơn hàng gồm: Mã đơn hàng, Khách hàng,Nhân viên,Chi nhánh, Tổng tiền,Trạng thái
--go
--create view V_ThongTinDh
--as 
select dh.DonHangID, kh.Hoten, kh.KhachHangID, dh.TrangThaiID, cn.ChiNhanhID, cn.DiaChi, dh.tongTienDon, nv.NhanVienID
from KhachHang kh 
inner join DonHang dh  on dh.KhachHangID=kh.KhachHangID
inner join NhanVien nv on nv.NhanVienID=dh.NhanVienID
inner join ChiNhanh cn on cn.ChiNhanhID=nv.ChiNhanhID;

/*
--Viết Stored Procedure nhận tham số @ChiNhanhID và hiển thị doanh thu của chi nhánh đó.
go
create procedure sp_DoanhThuChiNhanh
	@ChiNhanhID INT
as
begin 
	set nocount on 
	if exists (select 1 from ChiNhanh where @ChiNhanhID=ChiNhanhID) 
	begin
		select ChiNhanhID, sum(TongTienDon) as TongTienChiNhanh from DonHang where @ChiNhanhID=ChiNhanhID group by ChiNhanhID
		end
end;*/
exec sp_DoanhThuChiNhanh
	@ChiNhanhID = '3';
exec sp_DoanhThuChiNhanh
	@ChiNhanhID = '1';
/*
--Viết Stored Procedure tìm kiếm sản phẩm theo tên. Nếu không nhập tên thì hiển thị tất cả sản phẩm.
go
create procedure sp_NhapTenSanPham
	@TenSanPham nvarchar(100) = null
as
begin 
	if @TenSanPham is Null
	begin
		select * from SanPham;
	end
	else
	begin
		select TenSanPham, SanPhamID, MatHangID from SanPham where TenSanPham= @TenSanPham
	end
end;*/
exec sp_NhaptenSanPham
	@TenSanPham = null;
exec sp_NhaptenSanPham
	@TenSanPham = N'sữa đặc ông thọ'

/*
--Viet procedure them khach hang moi vao he thong khi dki tich diem.
go
create procedure sp_ThemKH
	@HoTen nvarchar(200),
	@Email varchar(200),
	@SDT varchar(20),
	@DiaChi nvarchar(max)
as 
begin 
	set nocount on;
	if exists(select 1 from KhachHang where @Hoten = Hoten)
	begin
		print(N'Khách Hàng đã có trong hệ thống',16,1, @HoTen);
	return;
	end;
		insert into KhachHang(HoTen,Email,SDT,DiaChi)
		values(@HoTen,@Email,@SDT,@DiaChi);
		print( N'Khách hàng mới')
end;*/
exec sp_ThemKH
	@HoTen = N'Nguyễn Nam',
	@Email = 'nguyen.nam@gmail.com',
	@SDT = '0901245700',
	@DiaChi = N'Quận Vũng Tàu, TP.HCM';
/*
--Viết Stored Procedure kiểm tra tồn kho.
go 
create procedure sp_TonKho 
	@HangTonID INT,
	@ChiNhanhID INT
as 
begin
	if exists (select 1 from HangTonKho where @HangTonID = HangTonID and @ChiNhanhID = ChiNhanhID and TonLai > 60)
	begin
		print(N'Tồn Kho còn nhiều hơn 60 món')
	end
	else
	begin
		print(N'Tồn Kho còn ít hơn 60 món, cần nhập thêm')
	end
end;
*/
exec sp_TonKho	
	@HangTonID = '5',
	@ChiNhanhID = '2';


