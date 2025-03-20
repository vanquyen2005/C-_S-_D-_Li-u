CREATE TRIGGER trg_KiemTraSoLuongTruocKhiThem
ON tblChiTietDonHang
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MaSanPham INT, @SoLuong INT;

    SELECT @MaSanPham = MaSanPham, @SoLuong = SoLuong
    FROM inserted;

    IF (@SoLuong > 50)
    BEGIN
        RAISERROR('Số lượng sản phẩm không được vượt quá 50!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO tblChiTietDonHang (MaDonHang, MaSanPham, SoLuong, DonGia)
    SELECT MaDonHang, MaSanPham, SoLuong, DonGia FROM inserted;
END;
GO

CREATE TRIGGER trg_ThongBaoDonHangMoi
ON tblChiTietDonHang
AFTER INSERT
AS
BEGIN
    DECLARE @MaSanPham INT, @SoLuong INT, @MaDonHang INT;

    SELECT @MaSanPham = MaSanPham, @SoLuong = SoLuong, @MaDonHang = MaDonHang
    FROM inserted;
	PRINT 'Thông báo: Đơn hàng mới đã được thêm. Mã đơn hàng: ' + CAST(@MaDonHang AS NVARCHAR(10)) + ', Mã sản phẩm: ' + CAST(@MaSanPham AS NVARCHAR(10)) + ', Số lượng: ' + CAST(@SoLuong AS NVARCHAR(10));
END;
GO

CREATE TRIGGER trg_ThongBaoDonHangHuy
ON tblDonHang
AFTER UPDATE
AS
BEGIN
    IF UPDATE(TrangThai)
    BEGIN
        DECLARE @MaDonHang INT, @TrangThai NVARCHAR(20);
        SELECT @MaDonHang = MaDonHang, @TrangThai = TrangThai FROM inserted;

        IF @TrangThai = N'Đã hủy'
        BEGIN
            PRINT 'Thông báo: Đơn hàng ' + CAST(@MaDonHang AS NVARCHAR(10)) + ' đã bị hủy.';
        END
    END
END;
GO

CREATE TRIGGER trg_CapNhatSoDonGiao
ON tblLichSuGiaoHang
AFTER INSERT
AS
BEGIN
    DECLARE @MaNhanVien INT;

    SELECT @MaNhanVien = MaNhanVien FROM inserted;

    UPDATE tblNhanVienGiaoHang
    SET SoDonGiao = SoDonGiao + 1
    WHERE MaNhanVien = @MaNhanVien; 
END;
GO

CREATE TRIGGER trg_KiemTraGiaTriDonHangToiThieu
ON tblDonHang
AFTER INSERT
AS
BEGIN
    DECLARE @TongTien DECIMAL(10,2);

    SELECT @TongTien = TongTien FROM inserted;

    IF (@TongTien < 10000)
    BEGIN
        RAISERROR('Số tiền đơn hàng tối thiểu là 10000!', 16, 1);
        ROLLBACK TRANSACTION; 
        RETURN;
    END
END;
GO

CREATE TRIGGER trg_CapNhatSoDienThoaiKhachHang
ON tblKhachHang
AFTER UPDATE
AS
BEGIN
    DECLARE @MaKhachHang INT, @SoDienThoai VARCHAR(15);

    SELECT @MaKhachHang = MaKhachHang, @SoDienThoai = SoDienThoai FROM inserted;

    UPDATE tblKhachHang
    SET SoDienThoai = @SoDienThoai
    WHERE MaKhachHang = @MaKhachHang; 
END;
GO

CREATE TRIGGER trg_XoaDonHangKhiKhachHangBiXoa
ON tblKhachHang
AFTER DELETE
AS
BEGIN
    DECLARE @MaKhachHang INT;

    SELECT @MaKhachHang = MaKhachHang FROM deleted;

    DELETE FROM tblDonHang WHERE MaKhachHang = @MaKhachHang;
    DELETE FROM tblChiTietDonHang WHERE MaDonHang IN (SELECT MaDonHang FROM tblDonHang WHERE MaKhachHang = @MaKhachHang);
End;
GO

CREATE TRIGGER trg_CapNhatTrangThaiDonHangKhiThoiGianGiaoDuocDuyet
ON tblLichSuGiaoHang
AFTER UPDATE
AS
BEGIN
    DECLARE @MaDonHang INT;

    SELECT @MaDonHang = MaDonHang FROM inserted;

    IF EXISTS (SELECT 1 FROM tblLichSuGiaoHang WHERE MaDonHang = @MaDonHang AND ThoiGianGiao <= GETDATE())
    BEGIN
        UPDATE tblDonHang
        SET TrangThai = N'Đã giao'
        WHERE MaDonHang = @MaDonHang; 
    END
END;
GO

ALTER TRIGGER trg_CapNhatTongTienDonHang
ON tblChiTietDonHang
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dh
    SET dh.TongTien = (
        SELECT SUM(ctdh.SoLuong * ctdh.DonGia)
        FROM tblChiTietDonHang ctdh
        WHERE ctdh.MaDonHang = dh.MaDonHang
    )
    FROM tblDonHang dh
    WHERE dh.MaDonHang IN (SELECT DISTINCT MaDonHang FROM inserted UNION SELECT DISTINCT MaDonHang FROM deleted);
END;
GO
