
INSERT INTO tblKhachHang (HoTen, SoDienThoai, DiaChi) VALUES
(N'Nguyễn Văn A', '0987654321', N'Hà Nội'),
(N'Trần Thị B', '0976543210', N'TP. Hồ Chí Minh'),
(N'Lê Văn C', '0965432109', N'Đà Nẵng'),
(N'Hoàng Minh D', '0956781234', N'Huế'),
(N'Phạm Thu E', '0945678123', N'Hải Phòng'),
(N'Ngô Quang F', '0934567812', N'Cần Thơ'),
(N'Bùi Thanh G', '0923456781', N'Bắc Giang'),
(N'Đinh Lan H', '0912345678', N'Quảng Ninh'),
(N'Lý Đức I', '0901234567', N'Nha Trang'),
(N'Trương Vĩnh K', '0898765432', N'Đồng Nai'),
(N'Khương LIều 7', '0898765437', N'Kom Tum'),
(N'VÕ Văn Q', '0898765473', N'Nghệ An'),
(N'Nguyễn Văn D', '0898765498', N'Bắc Giang'),
(N'Nguyễn Văn T', '0898765273', N'Long An'),
(N'Phạm Thị H', '0898765748', N'Đà Lạt');
GO

INSERT INTO tblNhanVienGiaoHang (HoTen, SoDienThoai) VALUES
(N'Phùng Gia Lâm','0123457891'),
(N'Đỗ Bảo Nam','0123457892'),
(N'Hoàng Mạnh Quân','0123457893'),
(N'Nguyễn Trung Đức','0123457894'),
(N'Trần Văn Hưng','0123457895'),
(N'Trần Đình Trọng ','0123457567'),  
(N'Nguyễn Đình ','0123457848'),
(N'Trần Quốc Tuấn','0123457859'),
(N'Bùi Anh Kiệt ','0123457869'),
(N'Ngô VĂn Đức','0123457950'),
(N'Trần Quang Diệu ','0123457847'),
(N'Trần Văn Sâm','0123457938'),
(N'Võ VĂn Nam','0123457837'),
(N'Lý A Kiều ','0123457843'),
(N'Trần Văn Sĩ','0123457832');
GO

INSERT INTO tblDonHang (MaKhachHang, NgayDat, TrangThai, TongTien, PhuongThucThanhToan) VALUES
(1, '2024-03-06', N'Chờ xử lý', 80000, N'Tiền mặt'),
(2, '2024-03-06', N'Đang giao', 20000, N'Chuyển khoản'),
(3, '2024-03-07', N'Đã giao', 10000, N'Thẻ tín dụng'),
(4, '2024-03-07', N'Đã hủy', 30000, N'Tiền mặt'),
(5, '2024-03-08', N'Đã hủy', 130000, N'Tiền mặt'), 
(6, '2024-03-08', N'Đang giao', 230000, N'Thẻ tín dụng'),
(7, '2024-03-09', N'Đã giao', 34000, N'Tiền mặt'),
(8, '2024-03-09', N'Đã hủy', 23000, N'Thẻ tín dụng'),
(9, '2024-03-10', N'Đang giao', 70000, N'Chuyển khoản'),
(10, '2024-03-10', N'Đã giao', 730000, N'Tiền mặt'),
(11, '2024-03-11', N'Đã giao', 330000, N'Chuyển khoản'),
(12, '2024-03-11', N'Đã giao', 64000, N'Tiền mặt'),
(13, '2024-03-12', N'Đã hủy', 90000, N'Thẻ tín dụng'),
(14, '2024-03-13', N'Đang giao', 30000, N'Tiền mặt'), 
(15, '2024-03-13', N'Đã hủy', 50000, N'Chuyển khoản');
GO

INSERT INTO tblSanPham (TenSanPham, DonGia) VALUES
(N'Bánh Quy', 25000),
(N'Nước ngọt', 10000),
(N'Sữa tươi', 20000),
(N'Bánh Mì', 10000),
(N'Bàn phím', 100000),
(N'Bia', 15000),
(N'Nước Suối ', 5000),
(N'Xôi', 15000),
(N'Chuột ', 50000),
(N'Đèn', 90000),
(N'Quần', 150000),
(N'Ốp Điện thoại', 34000),
(N'ổ điện', 120000),
(N'Giấy ăn ', 35000);
GO

INSERT INTO tblChiTietDonHang(MaDonHang,MaSanPham,SoLuong,DonGia) VALUES
(1,1,2,25000),
(2,2,3,10000),
(3,3,1,20000),
(4,4,1,10000),
(5,5,2,15000),
(6,6,3,100000),
(7,7,4,15000),
(8,8,3,5000),
(9,9,4,15000),
(10,10,5,50000),
(11,11,6,90000),
(12,12,3,150000),
(13,13,4,34000),
(14,14,1,120000),
(15,15,4,35000);
GO

INSERT INTO tblLichSuGiaoHang (MaDonHang, MaNhanVien, ThoiGianNhan, ThoiGianGiao, TrangThai) VALUES
(1, 1, '2024-03-07 08:00:00', ' 09:30:00', N'Đang giao'),
(2, 2, '2024-03-08 09:00:00', '2024-03-08 10:00:00', N'Đã giao'),
(3, 3, '2024-03-09 07:45:00', '2024-03-09 08:30:00', N'Đang giao'),
(4, 4, '2024-03-10 10:15:00', '2024-03-10 11:00:00', N'Đã giao'),
(5, 5, '2024-03-11 06:00:00', '2024-03-11 07:00:00', N'Đang giao'),
(6, 1, '2024-03-12 08:30:00', '2024-03-12 09:15:00', N'Đã giao'),
(7, 2, '2024-03-13 09:00:00', '2024-03-13 10:00:00', N'Bị hủy'),
(8, 3, '2024-03-14 11:00:00', '2024-03-14 12:00:00', N'Đã giao'),
(9, 4, '2024-03-15 07:30:00', '2024-03-15 08:30:00', N'Đang giao'),
(10, 5, '2024-03-16 08:00:00', '2024-03-16 09:00:00', N'Đã giao'),
(11, 1, '2024-03-17 06:45:00', '2024-03-17 07:30:00', N'Đang giao'),
(12, 2, '2024-03-18 07:15:00', '2024-03-18 08:00:00', N'Đã giao'),
(13, 3, '2024-03-19 09:30:00', '2024-03-19 10:30:00', N'Bị hủy'),
(14, 4, '2024-03-20 10:00:00', '2024-03-20 11:00:00', N'Đang giao'),
(15, 5, '2024-03-21 11:15:00', '2024-03-21 12:00:00', N'Đã giao');
Go
