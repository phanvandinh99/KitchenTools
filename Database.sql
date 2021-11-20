create database DatabaseKitchenTools
go
use DatabaseKitchenTools
go
create table TheLoai
(
	MaTheLoai int identity(1,1) primary key,
	TenTheLoai nvarchar(50) not null,
)
go
insert into TheLoai (TenTheLoai) values (N'Nồi Cơm Điện');
insert into TheLoai (TenTheLoai) values (N'Bếp Từ');
insert into TheLoai (TenTheLoai) values (N'Bếp Hồng Ngoại');
insert into TheLoai (TenTheLoai) values (N'Bếp Gas');
insert into TheLoai (TenTheLoai) values (N'Tủ Lạnh');
insert into TheLoai (TenTheLoai) values (N'Lò Nướng');
go
create table NhaSanXuat
(
	MaNhaSanXuat int identity(1,1) primary key,
	TenNhaSanXuat nvarchar(100) not null,
	TruSoChinh nvarchar(100) not null,
)
go
insert into NhaSanXuat (TenNhaSanXuat, TruSoChinh) values (N'SHARP', N'Nhật Bản');
insert into NhaSanXuat (TenNhaSanXuat, TruSoChinh) values (N'TOSHIBA', N'Nhật Bản');
insert into NhaSanXuat (TenNhaSanXuat, TruSoChinh) values (N'CUCKOO', N'Hàn Quốc');
insert into NhaSanXuat (TenNhaSanXuat, TruSoChinh) values (N'Panasonic', N'Nhật Bản');
insert into NhaSanXuat (TenNhaSanXuat, TruSoChinh) values (N'Sunhouse', N'Việt Nam');
insert into NhaSanXuat (TenNhaSanXuat, TruSoChinh) values (N'Kangaru', N'Việt Nam');
insert into NhaSanXuat (TenNhaSanXuat, TruSoChinh) values (N'Comet', N'Việt Nam');
insert into NhaSanXuat (TenNhaSanXuat, TruSoChinh) values (N'Philips', N'Hà Lan');
go
create table KhachHang
(
	TaiKhoanKH varchar(50) primary key,
	MatKhauKH varchar(50) not null,
	HoVaTen nvarchar(50) not null,
	SDT varchar(10) null,
	Email varchar(50) null,
	GioiTinh bit default('True'),
	DiaChi nvarchar(100) null,
	TrangThai int default(0),
)
--go
insert into KhachHang(TaiKhoanKH, MatKhauKH, HoVaTen, SDT,Email,GioiTinh,DiaChi) 
values('TuanAnh', 'Abc123', N'Tuấn Anh', '0972536525', 'tuananh@gmail.com', 0, N'TP. Hồ Chí Minh');
insert into KhachHang(TaiKhoanKH, MatKhauKH, HoVaTen, SDT,Email,GioiTinh,DiaChi) 
values('KhachHang', 'Abc123', N'Khách Hàng', '0974525152', 'khachhang@gmail.com', 0, N'TP. Hà Nội');
insert into KhachHang(TaiKhoanKH, MatKhauKH, HoVaTen, SDT,Email,GioiTinh,DiaChi) 
values('kimchi', 'Abc123', N'Nguyễn Kim Chi', '0348212365', 'kimchi@gmail.com', 0, N'TP. Đà Nẵng');
insert into KhachHang(TaiKhoanKH, MatKhauKH, HoVaTen, SDT,Email,GioiTinh,DiaChi) 
values('thuykieu', 'Abc123', N'Trần Thị Thúy Kiều', '0972132542', 'thuykieu@gmail.com', 0, N'TP. Vinh');
insert into KhachHang(TaiKhoanKH, MatKhauKH, HoVaTen, SDT,Email,GioiTinh,DiaChi) 
values('trongdat', 'Abc123', N'Nguyễn Trọng Đạt', '0965251451', 'TrongDat@gmail.com', 1, N'TP. Hồ Chí Minh');
go
create table SanPham 
(
	MaSanPham int identity(1,1) primary key,
	TenSanPham nvarchar(200) not null,
	GiaGoc money default(0),
	GiaKhuyenMai money default(0),
	TietKiem money default(0),
	LuotXem int default(0),
	MauSac nvarchar(50) null,
	ThoiGianBaoHanh int default(6), -- Thời gian bảo hành: 3 tháng / 6 tháng / 12 tháng / 36 tháng
	NoiLapRap nvarchar(50) null,
	MoTa nvarchar(max) null,
	AnhChinh nvarchar(max) null,
	Anh1 nvarchar(max) null,
	Anh2 nvarchar(max) null,
	Anh3 nvarchar(max) null,
	MaTheLoai_id int,
	MaNhaSanXuat_id int,

	foreign key(MaTheLoai_id) references TheLoai(MaTheLoai),
	foreign key(MaNhaSanXuat_id) references NhaSanXuat(MaNhaSanXuat),
)
go
--insert into SanPham (TenSanPham, GiaGoc, GiaKhuyenMai, TietKiem, LuotXem, MauSac, ThoiGianBaoHanh, NoiLapRap, MoTa, AnhChinh, Anh1, Anh2, Anh3, MaTheLoai_id, MaNhaSanXuat_id)
--values (N'Ten', giagoc, giakm, tietkiem, luotxem, mausac, baohanh, noilaprap, mota, anhchinh, anh1, anh2, anh3, matheloai, nsx );
insert into SanPham (TenSanPham, GiaGoc, GiaKhuyenMai, TietKiem, LuotXem, MauSac, ThoiGianBaoHanh, NoiLapRap, MoTa, AnhChinh, Anh1, Anh2, Anh3, MaTheLoai_id, MaNhaSanXuat_id)
values (N'Nồi cơm điện Sharp 1.8 lít KSH-D18V', 200000, 100000, 100000, 2, N'Trắng', 6, N'Thái Lan', N'abc abc', N'AnhNull.png', N'AnhNull.png', N'AnhNull.png', N'AnhNull.png', 1, 1 );
insert into SanPham (TenSanPham, GiaGoc, GiaKhuyenMai, TietKiem, LuotXem, MauSac, ThoiGianBaoHanh, NoiLapRap, MoTa, AnhChinh, Anh1, Anh2, Anh3, MaTheLoai_id, MaNhaSanXuat_id)
values (N'Nồi cơm điện Sharp 1.8 lít KS-NR191STV', 500000, 400000, 100000, 2, N'Trắng', 6, N'Thái Lan', N'abc abc', N'AnhNull.png', N'AnhNull.png', N'AnhNull.png', N'AnhNull.png', 1, 1 );
go
create table DonHang
(
	MaDonHang int identity(1,1) primary key,
	TenNguoiNhan nvarchar(100) not null, 
	NgayDat date default(getdate()),
	DiaChi nvarchar(100) null,
	SDT varchar(10) null,
	ThanhPho nvarchar(100) null,
	Quan nvarchar(100) null,
	Phuong nvarchar(100) null,
	TongTien money default(0),
	TrangThai int default(0),
	TaiKhoanKH_id varchar(50),
	foreign key(TaiKhoanKH_id) references KhachHang(TaiKhoanKH), -- đường quan hệ 
)
go
insert into DonHang (TenNguoiNhan, NgayDat, DiaChi, SDT, ThanhPho, Quan, Phuong, TongTien, TrangThai, TaiKhoanKH_id)
values (N'Tuấn Anh', '02/02/2021', N'20 Lê Duẫn', '0985452632', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', 250000, 1, 'TuanAnh');
insert into DonHang (TenNguoiNhan, NgayDat, DiaChi, SDT, ThanhPho, Quan, Phuong, TongTien, TrangThai, TaiKhoanKH_id)
values (N'Tuấn Anh', '02/02/2021', N'20 Lê Duẫn', '0985452632', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', 250000, 1, 'TuanAnh');
go
create table ChiTietDonHang
(
	MaDonHang_id int,
	MaSanPham_id int,
	primary key(MaDonHang_id,MaSanPham_id),
	SoLuongMua int default(1),
	ThanhTien money not null,
)
go
insert into ChiTietDonHang (MaDonHang_id, MaSanPham_id, SoLuongMua, ThanhTien) values (1, 1, 2, 500000);
insert into ChiTietDonHang (MaDonHang_id, MaSanPham_id, SoLuongMua, ThanhTien) values (2, 1, 2, 500000);