ALTER PROCEDURE sp_ThemKhachHang
    @HoTen NVARCHAR(100),
    @SoDienThoai VARCHAR(15),
    @DiaChi NVARCHAR(255)
AS
BEGIN
    INSERT INTO tblKhachHang (HoTen, SoDienThoai, DiaChi)
    VALUES (@HoTen, @SoDienThoai, @DiaChi);
END;
GO

ALTER  PROCEDURE sp_LayDonHangTheoTrangThai
    @TrangThai NVARCHAR(20)
AS
BEGIN
    SELECT * FROM tblDonHang WHERE TrangThai = @TrangThai;
END;
GO

ALTER  PROCEDURE sp_CapNhatTrangThaiDonHang
    @MaDonHang INT,
    @TrangThai NVARCHAR(20)
AS
BEGIN
    UPDATE tblDonHang
    SET TrangThai = @TrangThai
    WHERE MaDonHang = @MaDonHang;
END;
GO

ALTER  PROCEDURE sp_LayDanhSachSanPham
AS
BEGIN
    SELECT * FROM tblSanPham;
END;
GO

ALTER PROCEDURE sp_ThemDonHang
    @MaKhachHang INT,
    @NgayDat DATE,
    @TrangThai NVARCHAR(20),
    @TongTien DECIMAL(10,2),
    @PhuongThucThanhToan NVARCHAR(20)
AS
BEGIN
    INSERT INTO tblDonHang (MaKhachHang, NgayDat, TrangThai, TongTien, PhuongThucThanhToan)
    VALUES (@MaKhachHang, @NgayDat, @TrangThai, @TongTien, @PhuongThucThanhToan);
END;
GO

ALTER  PROCEDURE sp_LayDoanhThuTheoNgay
AS
BEGIN
    SELECT NgayDat, SUM(TongTien) AS TongDoanhThu
    FROM tblDonHang
    GROUP BY NgayDat;
END;
GO

ALTER PROCEDURE sp_LayDanhSachNhanVienGiaoHang
AS
BEGIN
    SELECT * FROM tblNhanVienGiaoHang;
END;
GO

ALTER PROCEDURE sp_LayLichSuGiaoHangTheoNhanVien
    @MaNhanVien INT
AS
BEGIN
    SELECT * FROM tblLichSuGiaoHang WHERE MaNhanVien = @MaNhanVien;
END;
GO

ALTER PROCEDURE sp_LayKhachHangTheoSoDienThoai
    @SoDienThoai VARCHAR(15)
AS
BEGIN
    SELECT * FROM tblKhachHang WHERE SoDienThoai = @SoDienThoai;
END;
GO

ALTER PROCEDURE sp_LayDonHangCuaKhachHang
    @MaKhachHang INT
AS
BEGIN
    SELECT * FROM tblDonHang WHERE MaKhachHang = @MaKhachHang;
END;
GO