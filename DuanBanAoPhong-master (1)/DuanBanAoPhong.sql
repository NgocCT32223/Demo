CREATE
DATABASE webAo;

USE
webAo;

-- Tạo bảng sanPham
CREATE TABLE san_pham
(
    id_san_pham  INT IDENTITY(1,1) PRIMARY KEY,
    ma_san_pham  VARCHAR(40) NULL,
    ten_san_pham NVARCHAR(255) NULL,
    trang_thai   INT
);

-- Tạo bảng MauSac
CREATE TABLE mau_sac
(
    id_mau_sac  INT IDENTITY(1,1) PRIMARY KEY,
    ma_mau_sac  VARCHAR(40) NULL,
    ten_mau_sac NVARCHAR(255) NULL,
    trang_thai  INT
);

-- Tạo bảng size
CREATE TABLE size
(
    id_size    INT IDENTITY(1,1) PRIMARY KEY,
    ma_size    VARCHAR(40) NULL,
    ten_size   NVARCHAR(255) NULL,
    trang_thai INT
);

-- Tạo bảng ChiTietSanPham
CREATE TABLE chi_tiet_san_pham
(
    id_san_pham_ct INT IDENTITY(1,1) PRIMARY KEY,
    id_san_pham    INT,
    id_mau_sac     INT,
    id_size        INT,
    chat_lieu      NVARCHAR(255),
    thuong_hieu    NVARCHAR(255),
    xuat_xu        NVARCHAR(255),
    gia_ban        decimal,
    gia_nhap       decimal,
    so_luong_ton   INT,
    ngay_nhap      DATE,
    trang_thai     INT,
    FOREIGN KEY (id_san_pham) REFERENCES san_pham (id_san_pham) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_mau_sac) REFERENCES mau_sac (id_mau_sac) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_size) REFERENCES size (id_size) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng KHUYENMAI
CREATE TABLE khuyen_mai
(
    id_khuyen_mai  INT IDENTITY(1,1) PRIMARY KEY,
    ma_khuyen_mai  VARCHAR(50),
    ten_khuyen_mai NVARCHAR(255),
    gia_tri        INT,
    ngay_tao       DATE,
    ngay_bat_dau   DATE,
    ngay_ket_thuc  DATE,
    mo_ta          NVARCHAR(255),
    so_luong       INT,
    trang_thai     INT
);

-- Tạo bảng CHUCVU
CREATE TABLE chuc_vu
(
    id_chuc_vu  INT IDENTITY(1,1) PRIMARY KEY,
    ma_chuc_vu  VARCHAR(50),
    ten_chuc_vu NVARCHAR(255),
    trang_thai  INT
);

-- Tạo bảng NHANVIEN
CREATE TABLE nhan_vien
(
    id_nhan_vien  INT IDENTITY(1,1) PRIMARY KEY,
    ma_nhan_vien  VARCHAR(50),
    ten_nhan_vien NVARCHAR(255),
    nam_sinh      INT,
    id_chuc_vu    INT,
    email         VARCHAR(255),
    sdt           VARCHAR(13),
    dia_chi       NVARCHAR(255),
    username      VARCHAR(50),
    passwords     VARCHAR(50),
    trang_thai    INT,
    FOREIGN KEY (id_chuc_vu) REFERENCES chuc_vu (id_chuc_vu) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng GIAOHANG
CREATE TABLE giao_hang
(
    id_giao_hang  INT IDENTITY(1,1) PRIMARY KEY,
    ngay_giao     DATE,
    ngay_nhan     DATE,
    dia_chi       NVARCHAR(255),
    phi_giao_hang decimal,
    trang_thai    INT
);

-- Tạo bảng THANHTOAN
CREATE TABLE thanh_toan
(
    id_thanh_toan   INT IDENTITY(1,1) PRIMARY KEY,
    ten_phuong_thuc NVARCHAR(255),
    ngay_thanh_toan DATE,
    trang_thai      INT
);

-- Tạo bảng KHACHHANG
CREATE TABLE khach_hang
(
    id_khach_hang  INT IDENTITY(1,1) PRIMARY KEY,
    ma_khach_hang  VARCHAR(50),
    ten_khach_hang NVARCHAR(255),
    sdt            VARCHAR(13),
    dia_chi        NVARCHAR(255),
    trang_thai     INT
);

-- Tạo bảng HOADON
CREATE TABLE hoa_don
(
    id_hoa_don    INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT,
    id_nhan_vien  INT,
    id_khuyen_mai INT,
    ma_hoa_don    VARCHAR(50),
    ngay_tao      DATE,
    id_thanh_toan INT,
    tong_tien     decimal,
    id_giao_hang  INT,
    trang_thai    INT,
    FOREIGN KEY (id_khach_hang) REFERENCES khach_hang (id_khach_hang) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien (id_nhan_vien) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_khuyen_mai) REFERENCES khuyen_mai (id_khuyen_mai) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_thanh_toan) REFERENCES thanh_toan (id_thanh_toan) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_giao_hang) REFERENCES giao_hang (id_giao_hang) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng CHITIETHOADON
CREATE TABLE chi_tiet_hoa_don
(
    id_hoa_don_ct  INT IDENTITY(1,1) PRIMARY KEY,
    ma_hoa_don_ct  VARCHAR(50),
    id_hoa_don     INT,
    id_san_pham_ct INT,
    so_luong       INT,
    gia            decimal,
    tong_tien      decimal,
    FOREIGN KEY (id_hoa_don) REFERENCES hoa_don (id_hoa_don) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_san_pham_ct) REFERENCES chi_tiet_san_pham (id_san_pham_ct) ON UPDATE CASCADE ON DELETE CASCADE
);
-- insert data SanPham
INSERT INTO san_pham (ma_san_pham, ten_san_pham, trang_thai)
VALUES ('SP001', N'Sản phẩm 1', 1),
       ('SP002', N'Sản phẩm 2', 1),
       ('SP003', N'Sản phẩm 3', 0),
       ('SP004', N'Sản phẩm 4', 1),
       ('SP005', N'Sản phẩm 5', 0),
       ('SP006', N'Sản phẩm 6', 1),
       ('SP007', N'Sản phẩm 7', 1),
       ('SP008', N'Sản phẩm 8', 0),
       ('SP009', N'Sản phẩm 9', 1),
       ('SP010', N'Sản phẩm 10', 0);
select*
from san_pham;
-- insert data MauSac
INSERT INTO mau_sac (ma_mau_sac, ten_mau_sac, trang_thai)
VALUES ('MS001', N'Màu đỏ', 1),
       ('MS002', N'Màu xanh lá', 1),
       ('MS003', N'Màu xanh dương', 0),
       ('MS004', N'Màu vàng', 1),
       ('MS005', N'Màu đen', 0),
       ('MS006', N'Màu trắng', 1),
       ('MS007', N'Màu tím', 1),
       ('MS008', N'Màu cam', 0),
       ('MS009', N'Màu hồng', 1),
       ('MS010', N'Màu nâu', 0);
select*
from mau_sac;
-- insert data size
INSERT INTO size (ma_size, ten_size, trang_thai)
VALUES ('SZ001', 'Size S', 1),
       ('SZ002', 'Size M', 1),
       ('SZ003', 'Size L', 0),
       ('SZ004', 'Size XL', 1),
       ('SZ005', 'Size XXL', 0),
       ('SZ006', 'Size XXXL', 1),
       ('SZ007', 'Size XS', 1),
       ('SZ008', 'Size XXS', 0),
       ('SZ009', 'Size XXXS', 1),
       ('SZ010', 'Size Free', 0);
select*
from size;
-- insert data ChiTietSanPham
INSERT INTO chi_tiet_san_pham (id_san_pham, id_mau_sac, id_size, chat_lieu, thuong_hieu, xuat_xu, gia_ban, gia_nhap,
                               so_luong_ton, ngay_nhap, trang_thai)
VALUES (1, 1, 1, 'Cotton', 'Brand A', 'Vietnam', 200000, 150000, 100, '2023-01-01', 1),
       (2, 2, 2, 'Polyester', 'Brand B', 'China', 250000, 180000, 50, '2023-02-01', 1),
       (3, 3, 3, 'Wool', 'Brand C', 'USA', 300000, 220000, 75, '2023-03-01', 0),
       (4, 4, 4, 'Silk', 'Brand D', 'Italy', 350000, 250000, 60, '2023-04-01', 1),
       (5, 5, 5, 'Linen', 'Brand E', 'France', 400000, 300000, 40, '2023-05-01', 0),
       (6, 6, 6, 'Denim', 'Brand F', 'Japan', 450000, 350000, 90, '2023-06-01', 1),
       (7, 7, 7, 'Leather', 'Brand G', 'Germany', 500000, 400000, 30, '2023-07-01', 1),
       (8, 8, 8, 'Rayon', 'Brand H', 'India', 550000, 450000, 80, '2023-08-01', 0),
       (9, 9, 9, 'Nylon', 'Brand I', 'Brazil', 600000, 500000, 70, '2023-09-01', 1),
       (10, 10, 10, 'Cashmere', 'Brand J', 'UK', 650000, 550000, 20, '2023-10-01', 0);
select*
from chi_tiet_san_pham;
-- insert data KhuyenMai
INSERT INTO khuyen_mai (ma_khuyen_mai, ten_khuyen_mai, gia_tri, ngay_tao, ngay_bat_dau, ngay_ket_thuc, mo_ta, so_luong,
                        trang_thai)
VALUES ('KM001', N'Khuyến mãi mùa xuân', 10, '2024-01-01', '2024-03-01', '2024-03-31',
        N'Giảm giá 10% cho tất cả các sản phẩm', 100, 1),
       ('KM002', N'Khuyến mãi mùa hè', 15, '2024-02-01', '2024-06-01', '2024-06-30',
        N'Giảm giá 15% cho tất cả các sản phẩm', 200, 1),
       ('KM003', N'Khuyến mãi mùa thu', 20, '2024-03-01', '2024-09-01', '2024-09-30',
        N'Giảm giá 20% cho tất cả các sản phẩm', 150, 0),
       ('KM004', N'Khuyến mãi mùa đông', 25, '2024-04-01', '2024-12-01', '2024-12-31',
        N'Giảm giá 25% cho tất cả các sản phẩm', 100, 1),
       ('KM005', N'Khuyến mãi đặc biệt', 30, '2024-05-01', '2024-11-01', '2024-11-30',
        N'Giảm giá 30% cho tất cả các sản phẩm', 50, 0),
       ('KM006', N'Khuyến mãi sinh nhật', 50, '2024-06-01', '2024-07-01', '2024-07-31',
        N'Giảm giá 50% cho tất cả các sản phẩm', 100, 1),
       ('KM007', N'Khuyến mãi cuối năm', 35, '2024-07-01', '2024-12-01', '2024-12-31',
        N'Giảm giá 35% cho tất cả các sản phẩm', 100, 1),
       ('KM008', N'Khuyến mãi VIP', 40, '2024-08-01', '2024-10-01', '2024-10-31',
        N'Giảm giá 40% cho tất cả các sản phẩm', 50, 0),
       ('KM009', N'Khuyến mãi khách hàng mới', 45, '2024-09-01', '2024-01-01', '2024-01-31',
        N'Giảm giá 45% cho tất cả các sản phẩm', 100, 1),
       ('KM010', N'Khuyến mãi khách hàng thân thiết', 60, '2024-10-01', '2024-08-01', '2024-08-31',
        N'Giảm giá 60% cho tất cả các sản phẩm', 75, 0);
select*
from khuyen_mai;
-- Insert data into CHUCVU
INSERT INTO chuc_vu (ma_chuc_vu, ten_chuc_vu, trang_thai)
VALUES ('CV001', N'Giám đốc', 1),
       ('CV002', N'Phó giám đốc', 1),
       ('CV003', N'Trưởng phòng', 1),
       ('CV004', N'Phó phòng', 1),
       ('CV005', N'Nhân viên', 1),
       ('CV006', N'Thực tập sinh', 1),
       ('CV007', N'Quản lý', 1),
       ('CV008', N'Kế toán', 1),
       ('CV009', N'Marketing', 1),
       ('CV010', N'Hành chính', 1);
select*
from chuc_vu;
-- Insert data into NHANVIEN
INSERT INTO nhan_vien (ma_nhan_vien, ten_nhan_vien, nam_sinh, id_chuc_vu, email, sdt, dia_chi, username, passwords,
                       trang_thai)
VALUES ('NV001', 'Nguyen Van A', 1980, 1, 'nguyenvana@example.com', '0123456789', 'Hanoi', 'nguyenvana', 'password1',
        1),
       ('NV002', 'Tran Thi B', 1985, 2, 'tranthib@example.com', '0987654321', 'Hanoi', 'tranthib', 'password2', 1),
       ('NV003', 'Le Van C', 1990, 3, 'levanc@example.com', '0912345678', 'Hanoi', 'levanc', 'password3', 1),
       ('NV004', 'Pham Thi D', 1992, 4, 'phamthid@example.com', '0901234567', 'Hanoi', 'phamthid', 'password4', 1),
       ('NV005', 'Hoang Van E', 1988, 5, 'hoangvane@example.com', '0923456789', 'Hanoi', 'hoangvane', 'password5', 1),
       ('NV006', 'Ngo Thi F', 1995, 6, 'ngothif@example.com', '0934567890', 'Hanoi', 'ngothif', 'password6', 1),
       ('NV007', 'Do Van G', 1982, 7, 'dovang@example.com', '0945678901', 'Hanoi', 'dovang', 'password7', 1),
       ('NV008', 'Ly Thi H', 1993, 8, 'lythih@example.com', '0956789012', 'Hanoi', 'lythih', 'password8', 1),
       ('NV009', 'Nguyen Van I', 1987, 9, 'nguyenvani@example.com', '0967890123', 'Hanoi', 'nguyenvani', 'password9',
        1),
       ('NV010', 'Tran Thi K', 1991, 10, 'tranthik@example.com', '0978901234', 'Hanoi', 'tranthik', 'password10', 1);
select*
from nhan_vien;
-- Insert data into GIAOHANG
INSERT INTO giao_hang (ngay_giao, ngay_nhan, dia_chi, phi_giao_hang, trang_thai)
VALUES ('2024-01-01', '2024-01-02', 'Hanoi', 50000, 1),
       ('2024-02-01', '2024-02-03', 'Hanoi', 60000, 1),
       ('2024-03-01', '2024-03-04', 'Hanoi', 70000, 1),
       ('2024-04-01', '2024-04-05', 'Hanoi', 80000, 1),
       ('2024-05-01', '2024-05-06', 'Hanoi', 90000, 1),
       ('2024-06-01', '2024-06-07', 'Hanoi', 100000, 1),
       ('2024-07-01', '2024-07-08', 'Hanoi', 110000, 1),
       ('2024-08-01', '2024-08-09', 'Hanoi', 120000, 1),
       ('2024-09-01', '2024-09-10', 'Hanoi', 130000, 1),
       ('2024-10-01', '2024-10-11', 'Hanoi', 140000, 1);
select*
from giao_hang;
-- Insert data into THANHTOAN
INSERT INTO thanh_toan (ten_phuong_thuc, ngay_thanh_toan, trang_thai)
VALUES (N'Tiền mặt', '2024-01-01', 1),
       (N'Chuyển khoản', '2024-02-01', 1),
       (N'Thẻ tín dụng', '2024-03-01', 1),
       (N'Ví điện tử', '2024-04-01', 1),
       (N'Paypal', '2024-05-01', 1),
       (N'Tiền mặt', '2024-06-01', 1),
       (N'Chuyển khoản', '2024-07-01', 1),
       (N'Thẻ tín dụng', '2024-08-01', 1),
       (N'Ví điện tử', '2024-09-01', 1),
       (N'Paypal', '2024-10-01', 1);
select*
from thanh_toan;
-- Insert data into KHACHHANG
INSERT INTO khach_hang (ma_khach_hang, ten_khach_hang, sdt, dia_chi, trang_thai)
VALUES ('KH001', 'Nguyen Van A', '0123456789', 'Hanoi', 1),
       ('KH002', 'Tran Thi B', '0987654321', 'Hanoi', 1),
       ('KH003', 'Le Van C', '0912345678', 'Hanoi', 1),
       ('KH004', 'Pham Thi D', '0901234567', 'Hanoi', 1),
       ('KH005', 'Hoang Van E', '0923456789', 'Hanoi', 1),
       ('KH006', 'Ngo Thi F', '0934567890', 'Hanoi', 1),
       ('KH007', 'Do Van G', '0945678901', 'Hanoi', 1),
       ('KH008', 'Ly Thi H', '0956789012', 'Hanoi', 1),
       ('KH009', 'Nguyen Van I', '0967890123', 'Hanoi', 1),
       ('KH010', 'Tran Thi K', '0978901234', 'Hanoi', 1);
select*
from khach_hang;
-- Insert data into HOADON
INSERT INTO hoa_don (id_khach_hang, id_nhan_vien, id_khuyen_mai, ma_hoa_don, ngay_tao, id_thanh_toan, tong_tien,
                     id_giao_hang, trang_thai)
VALUES (1, 1, 1, 'HD001', '2024-01-01', 1, 1000000, 1, 1),
       (2, 2, 2, 'HD002', '2024-02-01', 2, 2000000, 2, 1),
       (3, 3, 3, 'HD003', '2024-03-01', 3, 3000000, 3, 1),
       (4, 4, 4, 'HD004', '2024-04-01', 4, 4000000, 4, 1),
       (5, 5, 5, 'HD005', '2024-05-01', 5, 5000000, 5, 1),
       (6, 6, 6, 'HD006', '2024-06-01', 6, 6000000, 6, 1),
       (7, 7, 7, 'HD007', '2024-07-01', 7, 7000000, 7, 1),
       (8, 8, 8, 'HD008', '2024-08-01', 8, 8000000, 8, 1),
       (9, 9, 9, 'HD009', '2024-09-01', 9, 9000000, 9, 1),
       (10, 10, 10, 'HD010', '2024-10-01', 10, 10000000, 10, 1);
select*
from hoa_don;
-- Insert data into CHITIETHOADON
INSERT INTO chi_tiet_hoa_don (ma_hoa_don_ct, id_hoa_don, id_san_pham_ct, so_luong, gia, tong_tien)
VALUES ('CTHD001', 1, 1, 2, 500000, 1000000),
       ('CTHD002', 2, 2, 4, 500000, 2000000),
       ('CTHD003', 3, 3, 6, 500000, 3000000),
       ('CTHD004', 4, 4, 8, 500000, 4000000),
       ('CTHD005', 5, 5, 10, 500000, 5000000),
       ('CTHD006', 6, 6, 2, 3000000, 6000000),
       ('CTHD007', 7, 7, 3, 4000000, 7000000),
       ('CTHD008', 8, 8, 4, 5000000, 8000000),
       ('CTHD009', 9, 9, 5, 6000000, 9000000),
       ('CTHD010', 10, 10, 1, 7000000, 10000000);



