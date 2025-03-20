CREATE DATABASE QuanLyDonHang1;
GO

USE QuanLyDonHang1;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tblKhachHang') AND type = N'U')
CREATE TABLE tblKhachHang (
    MaKhachHang INT IDENTITY(1,1) PRIMARY KEY,
    HoTen NVARCHAR(100),
    SoDienThoai VARCHAR(15) UNIQUE,
    DiaChi NVARCHAR(255)
);
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tblNhanVienGiaoHang') AND type = N'U')
CREATE TABLE tblNhanVienGiaoHang (
    MaNhanVien INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15) UNIQUE NOT NULL,
    SoDonGiao INT DEFAULT 0
);
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tblDonhang') AND type = N'U')
CREATE TABLE tblDonHang (
    MaDonHang INT PRIMARY KEY IDENTITY(1,1),
    MaKhachHang INT,
    NgayDat DATE,
    TrangThai NVARCHAR(20) CHECK (TrangThai IN (N'Chờ xử lý', N'Đang giao', N'Đã giao', N'Đã hủy')),
    TongTien DECIMAL(10,2),
    PhuongThucThanhToan NVARCHAR(20) CHECK (PhuongThucThanhToan IN (N'Tiền mặt', N'Chuyển khoản', N'Thẻ tín dụng')),
    FOREIGN KEY (MaKhachHang) REFERENCES tblKhachHang(MaKhachHang)
);
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tbSanpham') AND type = N'U')
CREATE TABLE tblSanPham (
    MaSanPham INT PRIMARY KEY IDENTITY(1,1),
    TenSanPham NVARCHAR(100) NOT NULL,
    DonGia DECIMAL(10, 2)
);
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tblChiTietDonHang') AND type = N'U')
CREATE TABLE tblChiTietDonHang (
    MaChiTiet INT PRIMARY KEY IDENTITY(1,1),
    MaDonHang INT,
    MaSanPham INT,
    SoLuong INT,
    DonGia DECIMAL(10,2),
	Tonkho INT,
    FOREIGN KEY (MaDonHang) REFERENCES tblDonHang(MaDonHang),
        FOREIGN KEY (MaSanPham) REFERENCES tblSanPham(MaSanPham)
);
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tblLichSuGiaoHang') AND type = N'U')
CREATE TABLE tblLichSuGiaoHang (
    MaGiaoHang INT PRIMARY KEY IDENTITY(1,1),
    MaDonHang INT,
    MaNhanVien INT,
    ThoiGianNhan DATETIME,
    ThoiGianGiao DATETIME,
    TrangThai NVARCHAR(20) CHECK (TrangThai IN (N'Đang giao', N'Đã giao', N'Bị hủy')),
    FOREIGN KEY (MaDonHang) REFERENCES tblDonHang(MaDonHang),
    FOREIGN KEY (MaNhanVien) REFERENCES tblNhanVienGiaoHang(MaNhanVien)
);
GO