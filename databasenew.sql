USE [master]
GO
/****** Object:  Database [QuanLyThuVienDatabase]    Script Date: 2/1/2023 6:41:31 PM ******/
CREATE DATABASE [QuanLyThuVienDatabase] ON  PRIMARY 
( NAME = N'QuanLyThuVienDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyThuVienDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyThuVienDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyThuVienDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyThuVienDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyThuVienDatabase', N'ON'
GO
USE [QuanLyThuVienDatabase]
GO
/****** Object:  Table [dbo].[ChiTietPM]    Script Date: 2/1/2023 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPM](
	[MaCTPT] [varchar](50) NOT NULL,
	[MaSach] [varchar](50) NULL,
	[MaPhieuMuon] [varchar](50) NULL,
	[SoLuong] [int] NULL,
	[NgayMuon] [datetime] NULL,
	[NgayTra] [datetime] NULL,
	[NgayDenTra] [datetime] NULL,
	[TinhTrang] [nvarchar](250) NULL,
	[NgayThang] [date] NULL,
	[GhiChu] [nvarchar](250) NULL,
 CONSTRAINT [PK__ChiTietP__1E4E606BCCC17924] PRIMARY KEY CLUSTERED 
(
	[MaCTPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocGia]    Script Date: 2/1/2023 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocGia](
	[MaDG] [varchar](100) NOT NULL,
	[TenDG] [nvarchar](50) NULL,
	[GioiTinhDG] [nvarchar](50) NULL,
	[NgaySinhDG] [datetime] NULL,
	[EmailDG] [nvarchar](50) NULL,
	[DiaChiDG] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
	[TenTaiKhoanDG] [varchar](50) NULL,
	[MatKhauDG] [varchar](50) NULL,
 CONSTRAINT [pk_tblDocGia] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHSPhieuMuon]    Script Date: 2/1/2023 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHSPhieuMuon](
	[MaPhieu] [varchar](50) NOT NULL,
	[MaThuThu] [varchar](10) NULL,
	[MaDG] [varchar](100) NULL,
	[SLMuon] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblHSPhi__2660BFE0BA331DB6] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhaXuatBan]    Script Date: 2/1/2023 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaXuatBan](
	[MaNXB] [varchar](250) NOT NULL,
	[TenNXB] [nvarchar](500) NULL,
	[SoDienThoai] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[Website] [nvarchar](250) NULL,
	[TinhTrang] [nvarchar](250) NULL,
	[IsDeteled] [int] NULL,
 CONSTRAINT [PK_tblNhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSach]    Script Date: 2/1/2023 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSach](
	[MaSach] [varchar](50) NOT NULL,
	[NgNhapSach] [date] NULL,
	[TenSach] [nvarchar](50) NULL,
	[MaTheLoai] [varchar](250) NULL,
	[MaTacGia] [varchar](250) NULL,
	[MaNXB] [varchar](250) NULL,
	[NamXB] [int] NULL,
	[SLNhap] [int] NULL,
	[TriGia] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[Ghichu] [nvarchar](50) NULL,
 CONSTRAINT [pk_tblSach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTacGia]    Script Date: 2/1/2023 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTacGia](
	[MaTacGia] [varchar](250) NOT NULL,
	[TenTG] [nvarchar](250) NULL,
	[NgaySinh] [datetime] NULL,
	[SoDienThoai] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[TrangThai] [varchar](250) NULL,
	[IsDeteled] [int] NULL,
 CONSTRAINT [PK_tblTacGia] PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTheLoai]    Script Date: 2/1/2023 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTheLoai](
	[MaTheLoai] [varchar](250) NOT NULL,
	[TenTheLoai] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](250) NULL,
	[Status] [int] NULL,
	[IsDeteled] [int] NULL,
 CONSTRAINT [PK_tblTheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblThuThu]    Script Date: 2/1/2023 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblThuThu](
	[MaTT] [varchar](10) NOT NULL,
	[TenTT] [nvarchar](50) NULL,
	[GioiTinhTT] [nvarchar](50) NULL,
	[NgaySinhTT] [date] NULL,
	[EmailTT] [nvarchar](50) NULL,
	[DiaChiTT] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
	[TaiKhoanTT] [varchar](50) NULL,
	[MatKhauTT] [varchar](50) NULL,
 CONSTRAINT [pk_tblThuThu] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM001', N'Sach002', N'PhieuMuon001', 1, CAST(N'2023-06-02T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM002', N'Sach004', N'PhieuMuon001', 1, CAST(N'2023-06-02T00:00:00.000' AS DateTime), CAST(N'2023-06-15T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM003', N'Sach002', N'PhieuMuon001', 1, CAST(N'2021-07-06T00:00:00.000' AS DateTime), CAST(N'2023-02-01T18:29:36.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
GO
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG]) VALUES (N'DG020', N'Nguyễn Thị Như Kiều', N'Nữ', CAST(N'1993-01-27T00:00:00.000' AS DateTime), N'kieuminh@gmail.com', N'Thanh Xuân Hà Nội', N'', N'DocGia01', N'12345678')
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG]) VALUES (N'DG021', N'Triệu Nam Lộc ', N'Nữ', CAST(N'1992-10-02T00:00:00.000' AS DateTime), N'loc@gmail.com', N'Thanh Xuân Hà Nội', NULL, N'DocGia02', N'12345678')
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG]) VALUES (N'DG022', N'Nguyễn Thị Kim Ngân ', N'Nữ', CAST(N'1995-02-20T00:00:00.000' AS DateTime), N'kim@gmail.com', N'Thanh Xuân Hà Nội', NULL, N'DocGia03', N'12345678')
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG]) VALUES (N'DG023', N'Nguyễn Tân Đông Phát', N'Nữ', CAST(N'1997-09-15T00:00:00.000' AS DateTime), N'dong@gmail.com', N'Thanh Xuân Hà Nội', NULL, N'DocGia04', N'12345678')
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG]) VALUES (N'DG024', N'Lê Minh Hoàng Phượng ', N'Nữ', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'hoang@gmail.com', N'Thanh Xuân Hà Nội', NULL, N'DocGia05', N'12345678')
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG]) VALUES (N'DG025', N'Thạch Vương Tín', N'Nam', CAST(N'1994-07-21T00:00:00.000' AS DateTime), N'vuong@gmail.com', N'Thanh Xuân Hà Nội', NULL, N'DocGia010', N'12345678')
GO
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon001', N'TT001', N'DG021', 3, N'Đang Mượn', N'')
GO
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB001', N'Nhà xuất bản Trẻ', N'(024) 37734544', N'chinhanhhahoi@nxbtre.com.vn', N'Quận Hai Bà Trưng, Hà Nội', N'https:www.nxbtre.com.vn', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB002', N'Nhà xuất bản Kim Đồng', N'(024) 39428653', N'info@nxbkimdong.com.vn ', N'55 Quang Trung, Hà Nội', N'www.nxbkimdong.com ', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB003', N'Nhà xuất bản Tổng hợp', N'(028) 38 256 804', N'nstonhop@gmail.com', N'62 Nguyễn Thị Minh Khai, hà nội', N'https:nxbhcm.com.vn', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB004', N'Nhà xuất bản Hội Nhà văn', N'(024) 3822 2135', N'nhaxuatbanhnv@gmail.com', N'số 65 Nguyễn Du, Hà Nội', N'https:nxbhoinhavan.vn', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB005', N'Nhà xuất bản Chính trị quốc gia Sự thật', N' 024 3822 1581', N'phathanh@nxbctqg.vn', N'6/86 Duy tân, Cầu Giấy, Hà Nội', N'https:www.nxbctqg.org.vn', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB006', N'Nhà xuất bản Phụ nữ Việt Nam', N'(024) 37734544', N'truyenthong@gmail.com ', N'39 Hàng Chuối, Hà Nội', N'https:nxbphunu.com.vn', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB007', N'Nhà xuất bản Lao Động ', N'(024) 37734544', N'chinhanhhahoi@nxbtre.com.vn', N'175 Giảng Võ, Hà Nội', N'www.nxblaodong.com.vn', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB008', N'Nhà xuất bản Nhã Nam', N'0903244248', N'bookstore@nhanam.vn', N'59 Đỗ Quang, Cầu Giấy, Hà Nội', N'https:nhanam.vn', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB009', N'Nhà xuất bản Đinh Tị Books', N'0247.309.3388', N'contacts@dinhtibooks.vn', N'Trụ sở Nhà NV22, Hà Nội', N'https:dinhtibooks.com.vn', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [SoDienThoai], [Email], [DiaChi], [Website], [TinhTrang], [IsDeteled]) VALUES (N'NXB010', N'Nhà xuất bản Đông A', N'0247.309.3388', N'contacts@dinhtibooks.vn', N'Trụ sở Nhà NV22, Hà Nội', N'https:dinhtibooks.com.vn', NULL, NULL)
GO
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach001', CAST(N'2022-07-08' AS Date), N'Quả Dưa Đỏ', N'TheLoai007', N'TG001', N'NXB002', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach002', CAST(N'2022-07-08' AS Date), N'Đắc nhân tâm', N'TheLoai007', N'TG001', N'NXB002', 1990, 60, 30000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach003', CAST(N'2022-07-08' AS Date), N'Cách nghĩ để thành công', N'TheLoai007', N'TG002', N'NXB002', 1990, 60, 40000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach004', CAST(N'2022-07-08' AS Date), N'7 thói quen của người thành đạt ', N'TheLoai007', N'TG003', N'NXB004', 1990, 60, 50000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach005', CAST(N'2019-05-09' AS Date), N'Cuộc sống không giới hạn', N'TheLoai007', N'TG001', N'NXB005', 1990, 60, 60000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach006', CAST(N'2019-05-09' AS Date), N'Hành trình về Phương Đông', N'TheLoai003', N'TG002', N'NXB004', 1990, 70, 70000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach007', CAST(N'2019-05-09' AS Date), N'Người giàu có nhất thành Babylon', N'TheLoai004', N'TG003', N'NXB001', 1990, 70, 80000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach008', CAST(N'2019-05-09' AS Date), N'Quẳng gánh lo đi mà vui sống', N'TheLoai003', N'TG004', N'NXB001', 1990, 70, 10000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach009', CAST(N'2019-05-09' AS Date), N' Bộ sách – Hạt giống tâm hồn', N'TheLoai003', N'TG005', N'NXB002', 1990, 70, 30000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach010', CAST(N'2002-06-21' AS Date), N'Tốc độ của niềm tin', N'TheLoai003', N'TG001', N'NXB003', 1990, 70, 31000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach011', CAST(N'2002-06-21' AS Date), N'Thói quen thứ 8', N'TheLoai005', N'TG006', N'NXB003', 1990, 30, 3000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach012', CAST(N'2002-06-21' AS Date), N'Ông Già Và Biển Cả', N'TheLoai005', N'TG007', N'NXB003', 1990, 30, 40000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach013', CAST(N'2002-06-21' AS Date), N'Điều Kỳ Diệu Của Tiệm Tạp Hóa Namiya', N'TheLoai005', N'TG007', N'NXB003', 1990, 30, 30000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach014', CAST(N'1990-02-25' AS Date), N'Bắt Trẻ Đồng Xanh', N'TheLoai005', N'TG006', N'NXB007', 1990, 30, 21000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach015', CAST(N'1990-02-25' AS Date), N'Hai Vạn Dặm Dưới Đáy Biển', NULL, N'TG004', N'NXB007', 1990, 40, 23000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach016', CAST(N'1990-02-25' AS Date), N'Chiến Binh Cầu Vồng', NULL, N'TG004', N'NXB007', 1990, 40, 24000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach017', CAST(N'1990-02-25' AS Date), N'Khi Lỗi Thuộc Về Những Vì Sao', NULL, N'TG004', N'NXB007', 1990, 40, 25000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach018', CAST(N'1991-11-10' AS Date), N'Suối Nguồn', NULL, N'TG004', N'NXB007', 1990, 40, 26000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach019', CAST(N'1991-11-10' AS Date), N'Gatsby Vĩ Đại', NULL, N'TG004', N'NXB007', 1990, 40, 27000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach020', CAST(N'1991-11-10' AS Date), N'Số Đỏ', NULL, N'TG003', N'NXB003', 1990, 40, 28000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach021', CAST(N'1991-11-10' AS Date), N'Kiêu Hãnh Và Định Kiến', NULL, N'TG003', N'NXB003', 1990, 80, 30000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach022', CAST(N'1991-11-10' AS Date), N'Nỗi Buồn Chiến Tranh', NULL, N'TG003', N'NXB003', 1990, 80, 28000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach023', CAST(N'1991-11-10' AS Date), N'Bỉ vỏ', NULL, N'TG003', N'NXB003', 1990, 80, 40000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach024', CAST(N'1991-11-10' AS Date), N'Tiếng Chim Hót Trong Bụi Mận Gai', NULL, N'TG003', N'NXB003', 1990, 80, 41000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach025', CAST(N'1992-10-20' AS Date), N'Rừng Na Uy', NULL, N'TG006', N'NXB008', 1990, 80, 50000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach026', CAST(N'1992-10-20' AS Date), N'Bố Già', NULL, N'TG006', N'NXB008', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach027', CAST(N'1992-10-20' AS Date), N'Hai Số Phận', NULL, N'TG006', N'NXB008', 1990, 50, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach028', CAST(N'1992-10-20' AS Date), N'Trà Hoa Nữ', NULL, N'TG006', N'NXB008', 1990, 50, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach029', CAST(N'1992-10-20' AS Date), N'Hãy Chăm Sóc Mẹ', NULL, N'TG006', N'NXB008', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach030', CAST(N'1992-10-20' AS Date), N'Ở Quán Cà Phê Của Tuổi Trẻ Lạc Lối', NULL, N'TG006', N'NXB008', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach031', CAST(N'1994-09-17' AS Date), N'Cô Gái Mù Chữ Phá Bom Nguyên Tử', NULL, N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach032', CAST(N'1994-09-17' AS Date), N'Trăm Năm Cô Đơn', NULL, N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach033', CAST(N'1994-09-17' AS Date), N'Ba Ơi Mình Đi Đâu', NULL, N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach034', CAST(N'1994-09-17' AS Date), N'Cánh Đồng Bất Tận', NULL, N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach035', CAST(N'1994-09-17' AS Date), N'Cửa Hiệu Tự Sát', NULL, N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach036', CAST(N'1994-09-17' AS Date), N'Chuông Nguyện Hồn Ai', NULL, N'TG002', N'NXB005', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach037', CAST(N'2007-07-28' AS Date), N'Chúa Tể Những Chiếc Nhẫn', NULL, N'TG003', N'NXB005', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach038', CAST(N'2007-07-28' AS Date), N'Bay Trên Tổ Chim Cúc Cu', NULL, N'TG003', N'NXB005', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach039', CAST(N'2007-07-28' AS Date), N'Nanh Trắng', NULL, N'TG003', N'NXB005', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach040', CAST(N'2007-07-28' AS Date), N'Triệu Phú Khu Ổ Chuột', NULL, N'TG003', N'NXB004', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach041', CAST(N'2007-07-28' AS Date), N'Bột Mì Vĩnh Cửu', NULL, N'TG002', N'NXB004', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach042', CAST(N'2004-02-13' AS Date), N'Chúa Ruồi', NULL, N'TG002', N'NXB006', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach043', CAST(N'2004-02-13' AS Date), N'Hỏa Ngục', NULL, N'TG001', N'NXB005', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach044', CAST(N'2004-02-13' AS Date), N'Đèn Không Hắt Bóng', NULL, N'TG003', N'NXB004', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach045', CAST(N'2004-02-13' AS Date), N'Ăn Mày Dĩ Vãng', NULL, N'TG006', N'NXB003', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach046', CAST(N'2004-02-13' AS Date), N'Người Truyền Ký Ức', NULL, N'TG003', N'NXB001', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach047', CAST(N'2008-06-16' AS Date), N'Chí Phèo', NULL, N'TG003', N'NXB004', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach048', CAST(N'2008-06-16' AS Date), N'Biên Niên Ký Chim Vặn Dây Cót', NULL, N'TG004', N'NXB005', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach049', CAST(N'2008-06-16' AS Date), N'Người Đua Diều', NULL, N'TG001', N'NXB008', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach050', CAST(N'2008-06-16' AS Date), N'Kẻ Ích Kỷ Lãng Mạn', NULL, N'TG008', N'NXB004', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach051', CAST(N'2008-06-16' AS Date), N'Người Đọc', NULL, N'TG008', N'NXB003', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach052', CAST(N'2008-06-16' AS Date), N'Thế Giới Mới Tươi Đẹp', NULL, N'TG005', N'NXB004', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach053', CAST(N'1998-06-14' AS Date), N'Giết Con Chim Nhại', NULL, N'TG003', N'NXB005', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach054', CAST(N'1998-06-14' AS Date), N'Ông Già Và Biển Cả', N'TheLoai009', N'TG006', N'NXB006', 1990, 60, 20000, N'Mới', N'')
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach055', CAST(N'1998-06-14' AS Date), N'Trăm Năm Cô Đơn', N'TheLoai009', N'TG007', N'NXB007', 1990, 50, 20000, N'Mới', NULL)
GO
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG001', N'Nguyễn Nhật Ánh', CAST(N'1955-07-05T00:00:00.000' AS DateTime), N'0247.309.3388', N'nguyennhatanh@gmail.com', N'Nguyễn Trãi , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG002', N'Lê Bá Hán', CAST(N'1933-02-15T00:00:00.000' AS DateTime), N'(024) 37734544', N'lebahan@gmail.com', N'Đức Bồng, Vũ Quang, Hà Tĩnh', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG003', N'Hoàng Ngọc Hiến', CAST(N'1970-07-21T00:00:00.000' AS DateTime), N'0903244248', N'hoangngochien@gmail.com', N'Đức Phong, Đức Thọ, Hà Tĩnh', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG004', N'Trần Kim Hoa', CAST(N'1980-05-20T00:00:00.000' AS DateTime), N'0903244223', N'trankimhoa@gmail.com', N'Nguyễn Trãi , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG005', N'Tùng Bách', CAST(N'1960-07-05T00:00:00.000' AS DateTime), N'0403244224', N'tungback@gmail.com', N'Hoàng Quốc Việt Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG006', N'Nguyễn Văn Hưng', CAST(N'1985-05-26T00:00:00.000' AS DateTime), N'0403244224', N'nguyenvanhung@gmail.com', N'Số 80 Quang Trung, Hà Đông , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG007', N'Lê Mai Quyền', CAST(N'1983-05-30T00:00:00.000' AS DateTime), N'0403244234', N'lemaiquyen@gmail.com', N'Số 2 Lê Trọng Tấn , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG008', N'Nguyễn Thúy Hoa', CAST(N'1985-01-24T00:00:00.000' AS DateTime), N'0403244223', N'nguyenthuyhoa@gmail.com', N'Hoàng Mai , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG009', N'Lê Mai Trương', CAST(N'1985-05-27T00:00:00.000' AS DateTime), N'0403244233', N'lemaitruong@gmail.com', N'Khuất Duy Tiến , Hà Nội', NULL, NULL)
GO
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai001', N'Sách Khoa Học', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai002', N'Tình Cảm', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai003', N'Sách Giả tưởng', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai004', N'Sách Kinh dị, giật gân', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai005', N'Sách truyền cảm hứng', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai006', N'Tiểu sử', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai007', N'Truyện ngắn', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai008', N'Sách dạy nấu ăn', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai009', N'Sách Bài luận', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai010', N'Chính trị – pháp luật', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai011', N'test', N'fasfasd', NULL, 0)
GO
INSERT [dbo].[tblThuThu] ([MaTT], [TenTT], [GioiTinhTT], [NgaySinhTT], [EmailTT], [DiaChiTT], [GhiChu], [TaiKhoanTT], [MatKhauTT]) VALUES (N'TT001', N'Lê Xuân Hải', N'Nam', CAST(N'1996-05-12' AS Date), N'lexuanhai', N'hà nội', N'...', N'TT001', N'12345678')
GO
ALTER TABLE [dbo].[ChiTietPM]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPM_tblHSPhieuMuon] FOREIGN KEY([MaPhieuMuon])
REFERENCES [dbo].[tblHSPhieuMuon] ([MaPhieu])
GO
ALTER TABLE [dbo].[ChiTietPM] CHECK CONSTRAINT [FK_ChiTietPM_tblHSPhieuMuon]
GO
ALTER TABLE [dbo].[ChiTietPM]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPM_tblSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[tblSach] ([MaSach])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ChiTietPM] CHECK CONSTRAINT [FK_ChiTietPM_tblSach]
GO
ALTER TABLE [dbo].[tblHSPhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK__tblHSPhieu__MaDG__37A5467C] FOREIGN KEY([MaDG])
REFERENCES [dbo].[tblDocGia] ([MaDG])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[tblHSPhieuMuon] CHECK CONSTRAINT [FK__tblHSPhieu__MaDG__37A5467C]
GO
ALTER TABLE [dbo].[tblHSPhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_tblHSPhieuMuon_tblThuThu1] FOREIGN KEY([MaThuThu])
REFERENCES [dbo].[tblThuThu] ([MaTT])
GO
ALTER TABLE [dbo].[tblHSPhieuMuon] CHECK CONSTRAINT [FK_tblHSPhieuMuon_tblThuThu1]
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_tblNhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[tblNhaXuatBan] ([MaNXB])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_tblSach_tblNhaXuatBan]
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_tblTacGia] FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[tblTacGia] ([MaTacGia])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_tblSach_tblTacGia]
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_tblTheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[tblTheLoai] ([MaTheLoai])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_tblSach_tblTheLoai]
GO
USE [master]
GO
ALTER DATABASE [QuanLyThuVienDatabase] SET  READ_WRITE 
GO
