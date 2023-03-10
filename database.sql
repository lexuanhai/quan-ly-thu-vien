USE [master]
GO
/****** Object:  Database [QuanLyThuVienDatabase]    Script Date: 1/31/2023 6:51:12 AM ******/
CREATE DATABASE [QuanLyThuVienDatabase] ON  PRIMARY 
( NAME = N'QuanLyThuVienDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QuanLyThuVienDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyThuVienDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QuanLyThuVienDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[ChiTietPM]    Script Date: 1/31/2023 6:51:12 AM ******/
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
/****** Object:  Table [dbo].[tblDocGia]    Script Date: 1/31/2023 6:51:12 AM ******/
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
	[LoaiDG] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
	[TenTaiKhoanDG] [varchar](50) NULL,
	[MatKhauDG] [varchar](50) NULL,
	[NgLapThe] [date] NULL,
 CONSTRAINT [pk_tblDocGia] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHSPhieuMuon]    Script Date: 1/31/2023 6:51:12 AM ******/
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
/****** Object:  Table [dbo].[tblNhaXuatBan]    Script Date: 1/31/2023 6:51:12 AM ******/
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
/****** Object:  Table [dbo].[tblSach]    Script Date: 1/31/2023 6:51:12 AM ******/
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
/****** Object:  Table [dbo].[tblTacGia]    Script Date: 1/31/2023 6:51:12 AM ******/
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
/****** Object:  Table [dbo].[tblTheLoai]    Script Date: 1/31/2023 6:51:12 AM ******/
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
/****** Object:  Table [dbo].[tblThuThu]    Script Date: 1/31/2023 6:51:12 AM ******/
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
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM001', N'Sach001', N'PhieuMuon001', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Đã Trả', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM002', N'Sach002', N'PhieuMuon001', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM003', N'Sach002', N'PhieuMuon002', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM004', N'Sach005', N'PhieuMuon002', 0, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-02-05T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM005', N'Sach011', N'PhieuMuon003', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM006', N'Sach015', N'PhieuMuon003', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Đã Trả', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM007', N'Sach003', N'PhieuMuon003', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM008', N'Sach016', N'PhieuMuon004', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM009', N'Sach001', N'PhieuMuon001', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM010', N'Sach001', N'PhieuMuon004', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM011', N'Sach002', N'PhieuMuon005', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Đã Trả', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM012', N'Sach013', N'PhieuMuon005', 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Đã Trả', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM013', N'Sach023', N'PhieuMuon005', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Đã Trả', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM014', N'Sach013', N'PhieuMuon001', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM015', N'Sach013', N'PhieuMuon006', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-01-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM016', N'Sach027', N'PhieuMuon006', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM017', N'Sach007', N'PhieuMuon007', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM018', N'Sach007', N'PhieuMuon007', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM019', N'Sach003', N'PhieuMuon008', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM020', N'Sach026', N'PhieuMuon008', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM021', N'Sach008', N'PhieuMuon009', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM022', N'Sach025', N'PhieuMuon009', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM023', N'Sach041', N'PhieuMuon010', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM024', N'Sach037', N'PhieuMuon010', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM025', N'Sach009', N'PhieuMuon011', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM026', N'Sach042', N'PhieuMuon011', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM027', N'Sach047', N'PhieuMuon011', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM028', N'Sach024', N'PhieuMuon012', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM029', N'Sach039', N'PhieuMuon012', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM030', N'Sach041', N'PhieuMuon013', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM031', N'Sach043', N'PhieuMuon013', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM032', N'Sach010', N'PhieuMuon014', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM033', N'Sach030', N'PhieuMuon014', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM034', N'Sach018', N'PhieuMuon015', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-25T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM035', N'Sach038', N'PhieuMuon015', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-25T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM036', N'Sach008', N'PhieuMuon016', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM037', N'Sach016', N'PhieuMuon016', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM038', N'Sach002', N'PhieuMuon017', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM039', N'Sach007', N'PhieuMuon017', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM040', N'Sach025', N'PhieuMuon018', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-27T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM041', N'Sach041', N'PhieuMuon018', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-27T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM042', N'Sach003', N'PhieuMuon019', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-28T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM043', N'Sach012', N'PhieuMuon019', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-28T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM044', N'Sach003', N'PhieuMuon020', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-28T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM045', N'Sach009', N'PhieuMuon020', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-28T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM046', N'Sach003', N'PhieuMuon021', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM047', N'Sach048', N'PhieuMuon021', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM048', N'Sach001', N'PhieuMuon022', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-30T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM049', N'Sach028', N'PhieuMuon022', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-30T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM050', N'Sach051', N'PhieuMuon023', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-31T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM051', N'Sach040', N'PhieuMuon023', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-31T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM052', N'Sach005', N'PhieuMuon024', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-31T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM053', N'Sach019', N'PhieuMuon024', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-03-31T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM054', N'Sach024', N'PhieuMuon025', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-04-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM055', N'Sach045', N'PhieuMuon025', 1, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-04-01T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM056', N'Sach021', N'PhieuMuon026', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM057', N'Sach027', N'PhieuMuon026', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM058', N'Sach004', N'PhieuMuon027', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM059', N'Sach015', N'PhieuMuon027', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM060', N'Sach015', N'PhieuMuon028', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM061', N'Sach028', N'PhieuMuon028', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM062', N'Sach007', N'PhieuMuon028', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM063', N'Sach019', N'PhieuMuon028', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM064', N'Sach003', N'PhieuMuon001', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM065', N'Sach020', N'PhieuMuon030', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM066', N'Sach025', N'PhieuMuon030', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM067', N'Sach003', N'PhieuMuon031', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-24T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM068', N'Sach010', N'PhieuMuon031', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-24T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM069', N'Sach023', N'PhieuMuon032', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-25T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM070', N'Sach034', N'PhieuMuon032', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-25T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM071', N'Sach043', N'PhieuMuon033', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM072', N'Sach035', N'PhieuMuon033', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM073', N'Sach009', N'PhieuMuon034', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM074', N'Sach048', N'PhieuMuon034', 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-02-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM075', N'Sach050', N'PhieuMuon035', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-18T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM076', N'Sach049', N'PhieuMuon035', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-18T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM077', N'Sach005', N'PhieuMuon036', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-19T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM078', N'Sach029', N'PhieuMuon036', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-19T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM079', N'Sach003', N'PhieuMuon037', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-19T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM080', N'Sach007', N'PhieuMuon037', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-19T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM081', N'Sach012', N'PhieuMuon038', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM082', N'Sach028', N'PhieuMuon038', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM083', N'Sach003', N'PhieuMuon039', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM084', N'Sach007', N'PhieuMuon039', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM085', N'Sach017', N'PhieuMuon040', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM086', N'Sach055', N'PhieuMuon001', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM087', N'Sach055', N'PhieuMuon040', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM088', N'Sach016', N'PhieuMuon041', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM089', N'Sach053', N'PhieuMuon041', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM090', N'Sach054', N'PhieuMuon042', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM091', N'Sach055', N'PhieuMuon042', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-23T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM092', N'Sach048', N'PhieuMuon043', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-24T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM093', N'Sach034', N'PhieuMuon043', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-24T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM094', N'Sach004', N'PhieuMuon044', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM095', N'Sach019', N'PhieuMuon044', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM096', N'Sach033', N'PhieuMuon045', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM097', N'Sach003', N'PhieuMuon046', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM098', N'Sach014', N'PhieuMuon046', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-26T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM099', N'Sach017', N'PhieuMuon047', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM100', N'Sach041', N'PhieuMuon047', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
GO
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM101', N'Sach003', N'PhieuMuon048', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-28T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM102', N'Sach027', N'PhieuMuon048', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-28T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM103', N'Sach029', N'PhieuMuon049', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM104', N'Sach050', N'PhieuMuon049', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM105', N'Sach024', N'PhieuMuon050', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[ChiTietPM] ([MaCTPT], [MaSach], [MaPhieuMuon], [SoLuong], [NgayMuon], [NgayTra], [NgayDenTra], [TinhTrang], [NgayThang], [GhiChu]) VALUES (N'CTPM106', N'Sach055', N'PhieuMuon050', 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), NULL, N'Đang Mượn', NULL, N'')
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG001', N'Lê Huỳnh Trúc Ly', N'Nữ', CAST(N'1999-10-10T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG002', N'Nguyễn Thu Ngân', N'Nữ', CAST(N'1999-04-27T00:00:00.000' AS DateTime), N'ngan@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia002', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG003', N'Trần Hồng Bảo Ngọc ', N'Nữ', CAST(N'1999-05-21T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia003', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG004', N'Thạch Chanh Sai Gia ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia004', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG005', N'Nguyễn Phương Ngân ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia005', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG006', N'Nguyễn Huỳnh Mai Trúc ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia006', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG007', N'Châu Lan Anh ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia007', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG008', N'Võ Ngọc Hân ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia008', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG009', N'Nguyễn Nhật Hoàng', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia009', N'', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG010', N'Thái Thị Yến Nhi ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG011', N'Cao Hoàng Phương Trinh ', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG012', N'Hồng Thị Khánh Vân ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG013', N'Phan Yến Vi', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG014', N'Vũ Hồ Vân Nhi ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG015', N'Lê Thị Thúy Quyên', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG016', N'Nguyễn Thị Ngọc Diễm', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG017', N'Phạm Lê Thu Dung', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG018', N'Mai Lê Hải Đoan', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG019', N'Bùi Đông Hồ ', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG020', N'Nguyễn Thị Kiều', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG021', N'Triệu Nam Lộc ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG022', N'Nguyễn Thị Kim Ngân ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG023', N'Nguyễn Tân Đông Phát', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG024', N'Lê Minh Hoàng Phượng ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG025', N'Thạch Vương Tín', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia010', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG026', N'Nguyễn Thị Thanh Vân', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG027', N'Nguyễn Thị Hạnh Đào', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG028', N'Huỳnh Thị Trúc Giang', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG029', N'Huỳnh Thị Thúy Hằng', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG030', N'Hồng Kim Ngân ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG031', N'Đặng Thị Huỳnh Như ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG032', N'Nguyễn Thị Bích Như ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG033', N'Trần Minh Nhựt ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG034', N'Trần Thị Huyền Trâm', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG035', N'Nguyễn Thị Huỳnh Châm', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG036', N'Phạm Thị Cẩm Giang', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG037', N'Nguyễn Trung Hiếu', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG038', N'Huỳnh Hửu Khoa ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG039', N'Nguyễn Lâm Trúc Lam ', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG040', N'Nguyễn Trần Phương Linh', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG041', N'Lê Thị Tuyết Xuân ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG042', N'Nguyễn Thị Hoài Băng ', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG043', N'Lê Thị Thúy Di', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG044', N'Nguyễn Thị Tài Duy', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG045', N'LTạ Tuyết Hân', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG046', N'Nguyễn Cẩm Lài', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG047', N'Trần Thị Kim Lít ', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG048', N'Đặng Thị Tuyết Minh ', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG049', N'Mã Thanh Như', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG050', N'Tăng Thị Thanh Thanh', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG051', N'Lê Đặng Anh Thư', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG052', N'Phan Bảo Thy', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG053', N'Phạm Thị Mỹ Trang', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG054', N'Lê Diễm Huyền', N'Nữ', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblDocGia] ([MaDG], [TenDG], [GioiTinhDG], [NgaySinhDG], [EmailDG], [DiaChiDG], [LoaiDG], [GhiChu], [TenTaiKhoanDG], [MatKhauDG], [NgLapThe]) VALUES (N'DG055', N'Lưu Hoàng Luân ', N'Nam', CAST(N'1999-10-27T00:00:00.000' AS DateTime), N'trucly@gmail.com', N'Thanh Xuân Hà Nội', N'X', NULL, N'DocGia001', N'123', NULL)
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon001', N'TT001', N'DG001', 2, N'Đã Trả', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon002', N'TT001', N'DG002', 3, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon003', N'TT001', N'DG006', 3, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon004', N'TT001', N'DG003', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon005', N'TT001', N'DG001', 3, N'Đã Trả', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon006', N'TT001', N'DG028', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon007', N'TT001', N'DG018', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon008', N'TT001', N'DG020', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon009', N'TT001', N'DG025', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon010', N'TT001', N'DG023', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon011', N'TT001', N'DG020', 3, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon012', N'TT001', N'DG027', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon013', N'TT001', N'DG038', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon014', N'TT001', N'DG016', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon015', N'TT001', N'DG044', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon016', N'TT001', N'DG014', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon017', N'TT001', N'DG021', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon018', N'TT001', N'DG028', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon019', N'TT001', N'DG053', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon020', N'TT001', N'DG020', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon021', N'TT001', N'DG011', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon022', N'TT001', N'DG012', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon023', N'TT001', N'DG046', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon024', N'TT001', N'DG053', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon025', N'TT001', N'DG053', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon026', N'TT001', N'DG047', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon027', N'TT001', N'DG055', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon028', N'TT001', N'DG052', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon029', N'TT001', N'DG055', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon030', N'TT001', N'DG050', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon031', N'TT001', N'DG054', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon032', N'TT001', N'DG006', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon033', N'TT001', N'DG023', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon034', N'TT001', N'DG051', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon035', N'TT001', N'DG037', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon036', N'TT001', N'DG001', 2, N'Đã Trả', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon037', N'TT001', N'DG039', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon038', N'TT001', N'DG038', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon039', N'TT001', N'DG004', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon040', N'TT001', N'DG017', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon041', N'TT001', N'DG006', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon042', N'TT001', NULL, 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon043', N'TT001', N'DG041', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon044', N'TT001', N'DG053', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon045', N'TT001', N'DG001', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon046', N'TT001', N'DG029', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon047', N'TT001', N'DG034', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon048', N'TT001', N'DG024', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon049', N'TT001', N'DG036', 2, N'Đang Mượn', N'')
INSERT [dbo].[tblHSPhieuMuon] ([MaPhieu], [MaThuThu], [MaDG], [SLMuon], [TinhTrang], [GhiChu]) VALUES (N'PhieuMuon050', N'TT001', NULL, 2, N'Đang Mượn', N'')
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
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach015', CAST(N'1990-02-25' AS Date), N'Hai Vạn Dặm Dưới Đáy Biển', N'TheLoai028', N'TG004', N'NXB007', 1990, 40, 23000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach016', CAST(N'1990-02-25' AS Date), N'Chiến Binh Cầu Vồng', N'TheLoai028', N'TG004', N'NXB007', 1990, 40, 24000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach017', CAST(N'1990-02-25' AS Date), N'Khi Lỗi Thuộc Về Những Vì Sao', N'TheLoai028', N'TG004', N'NXB007', 1990, 40, 25000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach018', CAST(N'1991-11-10' AS Date), N'Suối Nguồn', N'TheLoai028', N'TG004', N'NXB007', 1990, 40, 26000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach019', CAST(N'1991-11-10' AS Date), N'Gatsby Vĩ Đại', N'TheLoai028', N'TG004', N'NXB007', 1990, 40, 27000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach020', CAST(N'1991-11-10' AS Date), N'Số Đỏ', N'TheLoai023', N'TG003', N'NXB003', 1990, 40, 28000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach021', CAST(N'1991-11-10' AS Date), N'Kiêu Hãnh Và Định Kiến', N'TheLoai023', N'TG003', N'NXB003', 1990, 80, 30000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach022', CAST(N'1991-11-10' AS Date), N'Nỗi Buồn Chiến Tranh', N'TheLoai023', N'TG003', N'NXB003', 1990, 80, 28000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach023', CAST(N'1991-11-10' AS Date), N'Bỉ vỏ', N'TheLoai023', N'TG003', N'NXB003', 1990, 80, 40000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach024', CAST(N'1991-11-10' AS Date), N'Tiếng Chim Hót Trong Bụi Mận Gai', N'TheLoai023', N'TG003', N'NXB003', 1990, 80, 41000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach025', CAST(N'1992-10-20' AS Date), N'Rừng Na Uy', N'TheLoai025', N'TG006', N'NXB008', 1990, 80, 50000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach026', CAST(N'1992-10-20' AS Date), N'Bố Già', N'TheLoai025', N'TG006', N'NXB008', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach027', CAST(N'1992-10-20' AS Date), N'Hai Số Phận', N'TheLoai025', N'TG006', N'NXB008', 1990, 50, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach028', CAST(N'1992-10-20' AS Date), N'Trà Hoa Nữ', N'TheLoai025', N'TG006', N'NXB008', 1990, 50, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach029', CAST(N'1992-10-20' AS Date), N'Hãy Chăm Sóc Mẹ', N'TheLoai025', N'TG006', N'NXB008', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach030', CAST(N'1992-10-20' AS Date), N'Ở Quán Cà Phê Của Tuổi Trẻ Lạc Lối', N'TheLoai025', N'TG006', N'NXB008', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach031', CAST(N'1994-09-17' AS Date), N'Cô Gái Mù Chữ Phá Bom Nguyên Tử', N'TheLoai017', N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach032', CAST(N'1994-09-17' AS Date), N'Trăm Năm Cô Đơn', N'TheLoai017', N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach033', CAST(N'1994-09-17' AS Date), N'Ba Ơi Mình Đi Đâu', N'TheLoai017', N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach034', CAST(N'1994-09-17' AS Date), N'Cánh Đồng Bất Tận', N'TheLoai017', N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach035', CAST(N'1994-09-17' AS Date), N'Cửa Hiệu Tự Sát', N'TheLoai017', N'TG008', N'NXB006', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach036', CAST(N'1994-09-17' AS Date), N'Chuông Nguyện Hồn Ai', N'TheLoai020', N'TG002', N'NXB005', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach037', CAST(N'2007-07-28' AS Date), N'Chúa Tể Những Chiếc Nhẫn', N'TheLoai020', N'TG003', N'NXB005', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach038', CAST(N'2007-07-28' AS Date), N'Bay Trên Tổ Chim Cúc Cu', N'TheLoai020', N'TG003', N'NXB005', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach039', CAST(N'2007-07-28' AS Date), N'Nanh Trắng', N'TheLoai020', N'TG003', N'NXB005', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach040', CAST(N'2007-07-28' AS Date), N'Triệu Phú Khu Ổ Chuột', N'TheLoai020', N'TG003', N'NXB004', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach041', CAST(N'2007-07-28' AS Date), N'Bột Mì Vĩnh Cửu', N'TheLoai020', N'TG002', N'NXB004', 1990, 90, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach042', CAST(N'2004-02-13' AS Date), N'Chúa Ruồi', N'TheLoai020', N'TG002', N'NXB006', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach043', CAST(N'2004-02-13' AS Date), N'Hỏa Ngục', N'TheLoai015', N'TG001', N'NXB005', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach044', CAST(N'2004-02-13' AS Date), N'Đèn Không Hắt Bóng', N'TheLoai015', N'TG003', N'NXB004', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach045', CAST(N'2004-02-13' AS Date), N'Ăn Mày Dĩ Vãng', N'TheLoai015', N'TG006', N'NXB003', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach046', CAST(N'2004-02-13' AS Date), N'Người Truyền Ký Ức', N'TheLoai013', N'TG003', N'NXB001', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach047', CAST(N'2008-06-16' AS Date), N'Chí Phèo', N'TheLoai013', N'TG003', N'NXB004', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach048', CAST(N'2008-06-16' AS Date), N'Biên Niên Ký Chim Vặn Dây Cót', N'TheLoai013', N'TG004', N'NXB005', 1990, 80, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach049', CAST(N'2008-06-16' AS Date), N'Người Đua Diều', N'TheLoai013', N'TG001', N'NXB008', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach050', CAST(N'2008-06-16' AS Date), N'Kẻ Ích Kỷ Lãng Mạn', N'TheLoai012', N'TG008', N'NXB004', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach051', CAST(N'2008-06-16' AS Date), N'Người Đọc', N'TheLoai012', N'TG008', N'NXB003', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach052', CAST(N'2008-06-16' AS Date), N'Thế Giới Mới Tươi Đẹp', N'TheLoai012', N'TG005', N'NXB004', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach053', CAST(N'1998-06-14' AS Date), N'Giết Con Chim Nhại', N'TheLoai012', N'TG003', N'NXB005', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach054', CAST(N'1998-06-14' AS Date), N'Ông Già Và Biển Cả', N'TheLoai009', N'TG006', N'NXB006', 1990, 60, 20000, N'Mới', NULL)
INSERT [dbo].[tblSach] ([MaSach], [NgNhapSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXB], [SLNhap], [TriGia], [TinhTrang], [Ghichu]) VALUES (N'Sach055', CAST(N'1998-06-14' AS Date), N'Trăm Năm Cô Đơn', N'TheLoai009', N'TG007', N'NXB007', 1990, 50, 20000, N'Mới', NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG001', N'Nguyễn Nhật Ánh', CAST(N'1955-07-05T00:00:00.000' AS DateTime), N'0247.309.3388', N'nguyennhatanh@gmail.com', N'Nguyễn Trãi , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG002', N'Lê Bá Hán', CAST(N'1933-02-15T00:00:00.000' AS DateTime), N'(024) 37734544', N'lebahan@gmail.com', N'Đức Bồng, Vũ Quang, Hà Tĩnh', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG003', N'Hoàng Ngọc Hiến', CAST(N'1970-07-21T00:00:00.000' AS DateTime), N'0903244248', N'hoangngochien@gmail.com', N'Đức Phong, Đức Thọ, Hà Tĩnh', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG004', N'Trần Kim Hoa', CAST(N'1980-05-20T00:00:00.000' AS DateTime), N'0903244223', N'trankimhoa@gmail.com', N'Nguyễn Trãi , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG005', N'Tùng Bách', CAST(N'1960-07-05T00:00:00.000' AS DateTime), N'0403244224', N'tungback@gmail.com', N'Hoàng Quốc Việt Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG006', N'Nguyễn Văn Hưng', CAST(N'1985-05-26T00:00:00.000' AS DateTime), N'0403244224', N'nguyenvanhung@gmail.com', N'Số 80 Quang Trung, Hà Đông , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG007', N'Lê Mai Quyền', CAST(N'1983-05-30T00:00:00.000' AS DateTime), N'0403244234', N'lemaiquyen@gmail.com', N'Số 2 Lê Trọng Tấn , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG008', N'Nguyễn Thúy Hoa', CAST(N'1985-01-24T00:00:00.000' AS DateTime), N'0403244223', N'nguyenthuyhoa@gmail.com', N'Hoàng Mai , Hà Nội', NULL, NULL)
INSERT [dbo].[tblTacGia] ([MaTacGia], [TenTG], [NgaySinh], [SoDienThoai], [Email], [DiaChi], [TrangThai], [IsDeteled]) VALUES (N'TG009', N'Lê Mai Trương', CAST(N'1985-05-27T00:00:00.000' AS DateTime), N'0403244233', N'lemaitruong@gmail.com', N'Khuất Duy Tiến , Hà Nội', NULL, NULL)
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
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai011', N'Khoa học công nghệ', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai012', N'Khoa học đời sống', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai013', N'Văn hóa xã hội', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai014', N'Kinh tế', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai015', N'Văn học nghệ thuật', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai016', N'Giáo trình', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai017', N'Tiểu thuyết', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai018', N'Tâm lý', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai019', N'Tâm linh', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai020', N'Tôn giáo', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai021', N'Sách thiếu nhi', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai022', N'Khoa học viễn tưởng', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai023', N'Tự truyện', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai024', N'Hồi ký', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai025', N'Khoa Học Khám Phá', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai026', N'Công Nghiệp Tương Lai', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai027', N'Sách thiếu niên', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai028', N'Sách Văn hóa xã hội', NULL, NULL, NULL)
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [GhiChu], [Status], [IsDeteled]) VALUES (N'TheLoai029', N'Lịch sử', NULL, NULL, NULL)
INSERT [dbo].[tblThuThu] ([MaTT], [TenTT], [GioiTinhTT], [NgaySinhTT], [EmailTT], [DiaChiTT], [GhiChu], [TaiKhoanTT], [MatKhauTT]) VALUES (N'TT001', N'Lê Xuân Hải', N'Nam', CAST(N'1996-05-12' AS Date), N'lexuanhai', N'hà nội', N'...', N'TT001', N'12345678')
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
