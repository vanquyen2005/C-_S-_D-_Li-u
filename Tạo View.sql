
ALTER VIEW vw_ChiTietDonHang AS
SELECT ctdh.MaChiTiet, ctdh.MaDonHang, sp.TenSanPham, ctdh.SoLuong, ctdh.DonGia
FROM tblChiTietDonHang ctdh
JOIN tblSanPham sp ON ctdh.MaSanPham = sp.MaSanPham;
GO

ALTER VIEW vw_DonHang_ChoXuLy AS
SELECT * FROM tblDonHang WHERE TrangThai = N'Chờ xử lý';
GO

ALTER VIEW vw_NhanVienGiaoHang AS
SELECT nv.MaNhanVien, nv.HoTen, nv.SoDienThoai, COUNT(lsgh.MaDonHang) AS SoDonDaGiao
FROM tblNhanVienGiaoHang nv
LEFT JOIN tblLichSuGiaoHang lsgh ON nv.MaNhanVien = lsgh.MaNhanVien AND lsgh.TrangThai = N'Đã giao'
GROUP BY nv.MaNhanVien, nv.HoTen, nv.SoDienThoai;
GO


ALTER VIEW vw_DonHang_DaHuy AS
SELECT * FROM tblDonHang WHERE TrangThai = N'Đã hủy';
GO

ALTER VIEW vw_DonHang_TheoPhuongThucThanhToan AS
SELECT PhuongThucThanhToan, COUNT(*) AS SoLuongDon, SUM(TongTien) AS TongTien
FROM tblDonHang
GROUP BY PhuongThucThanhToan;
GO


ALTER VIEW vw_DoanhThu_TheoNgay AS
SELECT NgayDat, SUM(TongTien) AS TongDoanhThu
FROM tblDonHang
GROUP BY NgayDat;
GO


ALTER VIEW vw_SanPham_BanChay AS
SELECT sp.MaSanPham, sp.TenSanPham, SUM(ctdh.SoLuong) AS TongSoLuongBan
FROM tblChiTietDonHang ctdh
JOIN tblSanPham sp ON ctdh.MaSanPham = sp.MaSanPham
GROUP BY sp.MaSanPham, sp.TenSanPham;
GO


ALTER VIEW vw_LichSuGiaoHang AS
SELECT lsgh.MaGiaoHang, lsgh.MaDonHang, kh.HoTen AS TenKhachHang, nv.HoTen AS TenNhanVien, lsgh.ThoiGianNhan, lsgh.ThoiGianGiao, lsgh.TrangThai
FROM tblLichSuGiaoHang lsgh
JOIN tblDonHang dh ON lsgh.MaDonHang = dh.MaDonHang
JOIN tblKhachHang kh ON dh.MaKhachHang = kh.MaKhachHang
JOIN tblNhanVienGiaoHang nv ON lsgh.MaNhanVien = nv.MaNhanVien;
GO

ALTER VIEW vw_SoLuongDonHang_TheoTrangThai AS
SELECT TrangThai, COUNT(*) AS SoLuongDon
FROM tblDonHang
GROUP BY TrangThai;
GO

ALTER VIEW vw_TongTien_DonHang_KhachHang AS
SELECT kh.MaKhachHang, kh.HoTen, SUM(dh.TongTien) AS TongTienDonHang
FROM tblDonHang dh
JOIN tblKhachHang kh ON dh.MaKhachHang = kh.MaKhachHang
GROUP BY kh.MaKhachHang, kh.HoTen;
GO