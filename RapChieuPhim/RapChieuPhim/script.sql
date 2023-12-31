USE [master]
GO
/****** Object:  Database [phim]    Script Date: 11/27/2022 9:26:32 PM ******/
CREATE DATABASE [phim]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'phim', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\phim.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'phim_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\phim_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [phim] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [phim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [phim] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [phim] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [phim] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [phim] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [phim] SET ARITHABORT OFF 
GO
ALTER DATABASE [phim] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [phim] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [phim] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [phim] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [phim] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [phim] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [phim] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [phim] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [phim] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [phim] SET  DISABLE_BROKER 
GO
ALTER DATABASE [phim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [phim] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [phim] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [phim] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [phim] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [phim] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [phim] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [phim] SET RECOVERY FULL 
GO
ALTER DATABASE [phim] SET  MULTI_USER 
GO
ALTER DATABASE [phim] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [phim] SET DB_CHAINING OFF 
GO
ALTER DATABASE [phim] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [phim] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [phim] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [phim] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'phim', N'ON'
GO
ALTER DATABASE [phim] SET QUERY_STORE = OFF
GO
USE [phim]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPhim] [int] NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayDang] [date] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[DanhGia] [int] NOT NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[id] [int] NOT NULL,
	[TenDanhMuc] [varchar](50) NOT NULL,
	[id_Phim] [int] NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ghe]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ghe](
	[ghe_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Loai_id] [int] NULL,
	[TringTrang] [bit] NOT NULL,
	[Id_phong] [int] NULL,
	[Id_Ve] [int] NULL,
	[TenGhe] [varchar](50) NULL,
 CONSTRAINT [PK_Ghe] PRIMARY KEY CLUSTERED 
(
	[ghe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieu]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPhong] [int] NULL,
	[NgayChieu] [datetime] NOT NULL,
	[GioBatDau] [varchar](50) NOT NULL,
	[GioKetThuc] [varchar](50) NOT NULL,
	[IdPhim] [int] NULL,
 CONSTRAINT [PK_LichChieu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiGhe]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGhe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiGhe] [nvarchar](max) NOT NULL,
	[GiaGhe] [float] NOT NULL,
 CONSTRAINT [PK_LoaiGhe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhim]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LoaiPhim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoiDung]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDung](
	[id] [int] NOT NULL,
	[Id_binhLuan] [int] NULL,
	[Id_TaiKhoan] [int] NULL,
 CONSTRAINT [PK_NoiDung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phim]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](max) NOT NULL,
	[AnhPhim] [nvarchar](max) NOT NULL,
	[ThoiLuong] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TinhTrang] [bit] NOT NULL,
	[IdLoaiPhim] [int] NOT NULL,
	[DienVien] [nvarchar](max) NOT NULL,
	[DaoDien] [varchar](max) NOT NULL,
	[NgayCongChieu] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
	[NamPhatHanh] [varchar](50) NULL,
	[ChatLuong] [varchar](50) NULL,
 CONSTRAINT [PK_Phim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRapChieu] [int] NULL,
	[TenPhong] [nvarchar](max) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[TrinhTrang] [bit] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RapPhim]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RapPhim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenRapChieu] [nvarchar](50) NOT NULL,
	[TongSoPhong] [int] NOT NULL,
	[ThanhPho] [nvarchar](max) NULL,
	[QuanHuyen] [nvarchar](max) NULL,
	[PhuongXa] [nvarchar](max) NULL,
	[KhungGio] [nvarchar](max) NULL,
 CONSTRAINT [PK_RapChieuPhim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](60) NULL,
	[NgayDangKy] [date] NULL,
	[TinhTrang] [bit] NULL,
	[PhanQuyen] [varchar](50) NULL,
	[id_ThongTin] [int] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTin]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTin](
	[ThongTin_id] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](max) NULL,
	[DiaChi] [varchar](max) NULL,
	[GioiTinh] [nvarchar](max) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_ThongTin] PRIMARY KEY CLUSTERED 
(
	[ThongTin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ve]    Script Date: 11/27/2022 9:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTaiKhoan] [int] NULL,
	[IdRap] [int] NULL,
	[NgayDat] [datetime2](7) NULL,
	[GiaVe] [decimal](18, 2) NULL,
	[Id_LichChieu] [int] NULL,
	[Soluong] [int] NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ghe] ON 

INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (1, 1, 1, 1, 45, N'A1')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (2, 1, 0, 1, NULL, N'A2')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (3, 1, 1, 1, 11, N'A3')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (4, 1, 0, 1, NULL, N'A4')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (5, 1, 1, 1, 15, N'A5')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (6, 2, 0, 1, NULL, N'A6')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (7, 2, 0, 1, NULL, N'A7')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (8, 2, 0, 1, NULL, N'A8')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (9, 2, 1, 1, 13, N'A9')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (10, 1, 0, 1, NULL, N'9A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (12, 1, 0, 1, NULL, N'8A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (13, 1, 0, 1, NULL, N'7A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (14, 1, 0, 1, NULL, N'6A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (15, 1, 1, 1, 10, N'5A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (16, 2, 0, 1, NULL, N'4A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (17, 2, 1, 1, 14, N'3A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (18, 2, 0, 1, NULL, N'2A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (19, 2, 0, 1, NULL, N'1A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (21, 2, 0, 1, NULL, N'AA')
SET IDENTITY_INSERT [dbo].[Ghe] OFF
GO
SET IDENTITY_INSERT [dbo].[LichChieu] ON 

INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (1, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (2, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'20:20', N'21:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (3, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'21-20', N'11:50', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (4, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'10:30', N'11:30', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (5, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:20', N'11:50', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (6, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (7, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (8, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (9, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (10, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (11, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'20:20', N'21:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (12, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (13, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'20:20', N'21:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (14, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:20', N'11:50', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (15, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (16, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:20', N'11:50', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (17, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (18, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:20', N'11:50', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (19, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (20, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (21, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (22, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (23, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (24, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (25, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (26, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (27, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (28, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (29, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (30, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (31, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (32, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (33, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (34, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (37, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (38, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (39, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (40, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (41, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (42, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (43, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (44, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (45, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (46, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (47, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (48, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (49, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (50, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (51, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
SET IDENTITY_INSERT [dbo].[LichChieu] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiGhe] ON 

INSERT [dbo].[LoaiGhe] ([Id], [TenLoaiGhe], [GiaGhe]) VALUES (1, N'Vip', 95000)
INSERT [dbo].[LoaiGhe] ([Id], [TenLoaiGhe], [GiaGhe]) VALUES (2, N'Thường', 45000)
SET IDENTITY_INSERT [dbo].[LoaiGhe] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiPhim] ON 

INSERT [dbo].[LoaiPhim] ([Id], [TenLoai]) VALUES (1, N'Phim Marvel')
INSERT [dbo].[LoaiPhim] ([Id], [TenLoai]) VALUES (2, N'Phim Hàn Quốc')
INSERT [dbo].[LoaiPhim] ([Id], [TenLoai]) VALUES (3, N'Phim Thái Lan')
INSERT [dbo].[LoaiPhim] ([Id], [TenLoai]) VALUES (4, N'Phim Hoạt Hình')
SET IDENTITY_INSERT [dbo].[LoaiPhim] OFF
GO
SET IDENTITY_INSERT [dbo].[Phim] ON 

INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (2, N'The Falcon and the Winter Soldier', N'falcon_winter_soldier_poster.jpg', 360, N'The Falcon and the Winter Soldier[a] is an American television miniseries created by Malcolm Spellman for the streaming service Disney+, based on Marvel Comics featuring the characters Sam Wilson / Falcon and Bucky Barnes / Winter Soldier. It is the second television series in the Marvel Cinematic Universe (MCU) produced by Marvel Studios, sharing continuity with the films of the franchise, and is set six months after Sam Wilson was handed the mantle of Captain America in the film Avengers: Endgame (2019). Wilson teams up with Bucky Barnes to stop anti-patriots who believe the world was better during the Blip. Spellman served as head writer for the series, which was directed by Kari Skogland.', 1, 1, N'	
Sebastian Stan
Anthony Mackie
Wyatt Russell
Erin Kellyman
Danny Ramirez
Georges St-Pierre
Adepero Oduye
Don Cheadle
Daniel Brühl
Emily VanCamp
Florence Kasumba
Julia Louis-Dreyfus', N'	Kari Skogland', CAST(N'2021-03-19T00:00:00.000' AS DateTime), CAST(N'2021-07-21T00:00:00.000' AS DateTime), N'2021', N'FULL HD VIETSUB')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (3, N'Doctor Strange in the Multiverse of Madness', N'doctor_strange_multiverse_of_madness_vose.jpg', 126, N'Doctor Strange teams up with a mysterious teenage girl from his dreams who can travel across multiverses, to battle multiple threats, including other-universe versions of himself, which threaten to wipe out millions across the multiverse. They seek help from Wanda the Scarlet Witch, Wong and others.', 1, 1, N'Benedict Cumberbatch
Elizabeth Olsen
Chiwetel Ejiofor
Benedict Wong
Xochitl Gomez
Michael Stuhlbarg
Rachel McAdams', N'	Sam Raimi', CAST(N'2022-05-02T00:00:00.000' AS DateTime), CAST(N'2022-05-06T00:00:00.000' AS DateTime), N'2022', N'FULL HD VIETSUB')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (4, N'Ms. Marvel', N'ms.marvel(2022).jpg', 300, N'Kamala is a superhero fan with an imagination, particularly when it comes to Captain Marvel; Kamala feels like she doesn''t fit in at school and sometimes even at home, that is until she gets superpowers like the heroes she''s looked up to.', 1, 1, N'	
Iman Vellani
Matt Lintz
Yasmeen Fletcher
Zenobia Shroff
Mohan Kapur
Saagar Shaikh
Laurel Marsden
Azhar Usman
Rish Shah
Arian Moayed
Alysia Reiner
Laith Nakli
Nimra Bucha
Travina Springer
Adaku Ononogbo
Samina Ahmad
Fawad Khan
Mehwish Hayat
Farhan Akhtar
Aramis Knight', N'	Bisha K. Ali', CAST(N'2022-06-08T00:00:00.000' AS DateTime), CAST(N'2022-07-13T00:00:00.000' AS DateTime), N'2022', N'FULL HD VIETSUB')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (5, N'Ant-Man and the Wasp: Quantumania', N'ant-man-and-the-wasp-quantumania-poster.jpg', 126, N'Scott Lang and Hope Van Dyne, along with Hank Pym and Janet Van Dyne, explore the Quantum Realm, where they interact with strange creatures and embark on an adventure that goes beyond the limits of what they thought was possible.', 1, 1, N'	
Paul Rudd
Evangeline Lilly
Jonathan Majors
Kathryn Newton
William Jackson Harper
Bill Murray
Michelle Pfeiffer
Michael Douglas', N'	Peyton Reed', CAST(N'2023-02-17T00:00:00.000' AS DateTime), CAST(N'2023-04-20T00:00:00.000' AS DateTime), N'2023', N'FULL HD VIETSUB')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (24, N'Choco Milk Shake (2022)', N'Choco Milk Shake.jpg', 180, N'A cat and dog crossed a rainbow bridge, but came back as humans?!

Jung Woo lives alone after losing his parents at the age of 20 and working part-time in his Uncle''s shop. One day, two strangers enter the house and claim they were Choco and Milk! The two were indeed the reincarnation of Choco and Milk whom he raised from childhood to high school and lost by an accident. The arrival of the two embarks on a new beginning and the quest to discover love.', 1, 2, N'Hojung Ko, Seong Hyuk Kim, Jae-bin Lee, Seung-bin Park', N'Ahn Ji-hee', CAST(N'2022-10-25T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), N'2022', N'FULL HD VIETSUB ')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (25, N'Our Beloved Summer', N'Our_Beloved_Summer.jpg', 180, N'A special episode that includes a summary of the series ‘Our Beloved Summer’,  interviews with actors and behind the scenes footage. ', 1, 2, N'Choi Woo-shik, Kim Da-mi ,Kim Sung-cheol, Roh Jeong-eui', N'Kim Yoon-jin', CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), N'2021', N'FULL HD VIETSUB ')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (26, N'Ocean Likes Me', N'Ocean Likes Me (2022).jpg', 80, N'''Ocean Like Me'' is a healing food romance between Han Bada, a young entrepreneur who dreams of starting an udon restaurant with a beach in the background but finds serving customers difficult. Bada then meets Tommy, a failed musician who returns to his hometown after wandering and has a new dream. Together, both of them step towards their dreams.', 1, 2, N'Han Gi-Chan, Tae-Seob Go', N'Lee Su Ji', CAST(N'2022-04-26T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), N'2', N'FULL HD VIETSUB ')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (27, N'20th Century Girl', N'20th Century Girl.jpg', 120, N'In 1999, a teen with a heart of gold begins keeping close tabs on a popular classmate as a favor to her smitten best friend.

Bo Ra is 17-year-old high school student. She is good at taekwondo and has a bright and positive personality. She is also a member of the broadcasting club at her school. Woon Ho is a member of the same broadcasting club.

Bo Ra is best friends with Yeon Du, who attends the same school. Yeon Du has a crush on Hyun Jin. She asks Bo Ra to find out everything about Hyun Jin and goes to the U.S. to have heart surgery. After that, Bo Ra begins to observe Hyun Jin closely and she falls in love with him.', 1, 2, N'Kim Yoo-jung, Byeon Woo-seok, Park Jung-woo, Roh Yoon-seo', N'Bang Woo-ri', CAST(N'2022-10-06T00:00:00.000' AS DateTime), CAST(N'2022-10-06T00:00:00.000' AS DateTime), N'2022', N'FULL HD VIETSUB ')
SET IDENTITY_INSERT [dbo].[Phim] OFF
GO
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([Id], [IdRapChieu], [TenPhong], [SoLuong], [TrinhTrang], [MoTa]) VALUES (1, 2, N'Phòng VIP', 13, 1, N'Phòng Cao Cấp')
INSERT [dbo].[Phong] ([Id], [IdRapChieu], [TenPhong], [SoLuong], [TrinhTrang], [MoTa]) VALUES (2, 6, N'Phòng VIP', 12, 1, N'Phòng Cao Cấp')
SET IDENTITY_INSERT [dbo].[Phong] OFF
GO
SET IDENTITY_INSERT [dbo].[RapPhim] ON 

INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (1, N'Cinestar Quốc Thanh ', 12, N'HCM', N'Q9', NULL, NULL)
INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (2, N'DCINE Bến Thành ', 12, N'HN', N'Mỹ Đình', NULL, NULL)
INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (4, N'Galaxy Nguyễn Du', 12, N'HCM', N'q1', NULL, NULL)
INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (5, N'Rap Đông Đa', 12, N'HN', N'HN', NULL, NULL)
INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (6, N'Rap Hoang Mai', 12, N'Hà Nội', N'Long Biên', N'Xa ss', N'7:30-21:29')
SET IDENTITY_INSERT [dbo].[RapPhim] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (1, N'admin@gmail.com', N'12345678', CAST(N'2020-09-12' AS Date), 1, N'MANAGA', 1)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (8, N'test343434@gmail.com', N'1234', CAST(N'2021-12-04' AS Date), 1, N'USER', 1)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (9, N'3434', N'username1@gmail.com', CAST(N'2022-01-21' AS Date), 1, N'USER', 4)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (10, N'3343', N'test@gmail.com', CAST(N'2022-01-25' AS Date), 1, N'USER', 5)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (11, N'3434', N'aaaa@gmail.com', CAST(N'2022-01-25' AS Date), 1, N'USER', 6)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (12, N'3434', N'user1@gmail.com', CAST(N'2022-01-25' AS Date), 1, N'USER', 7)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (13, N'nguyenxuanhuu12c3@gmail.com', N'XuanHuu@2002', CAST(N'2022-11-27' AS Date), 1, N'MANAGA', 8)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (15, N'nguyenxuanhuu12c3@gmail.com', N'1112', CAST(N'2022-11-27' AS Date), 1, N'MANAGA', 9)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTin] ON 

INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (1, N'Nguyễn Văn A', N'HCM', N'Nam', CAST(N'2020-12-20T00:00:00.000' AS DateTime), N'username1@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (2, N'Nguyễn Văn B ', N'HCM', N'Nam', CAST(N'2020-12-11T00:00:00.000' AS DateTime), N'username1@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (3, N'Nguyễn Văn C', N'HCM', N'Nam', CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'username1@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (4, N'username1@gmail.com', N'HCM', N'Nam', CAST(N'2022-01-21T11:24:22.393' AS DateTime), N'username1@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (5, N'test@gmail.com', N'HCM', N'Nam', CAST(N'2022-01-25T20:47:49.280' AS DateTime), N'test@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (6, N'aaaa@gmail.com', N'HCM', N'Nam', CAST(N'2022-01-25T20:54:30.207' AS DateTime), N'aaaa@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (7, N'user1@gmail.com', N'HCM', N'Nam', CAST(N'2022-01-25T21:13:07.863' AS DateTime), N'user1@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (8, N'XuanHuu', N'HCM', N'Nam', CAST(N'2022-11-27T01:49:35.493' AS DateTime), N'nguyenxuanhuu12c3@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (9, N'SaintNguyen', N'HCM', N'Nam', CAST(N'2022-11-27T01:50:30.260' AS DateTime), N'nguyenxuanhuu12c3@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (10, N'Nguyễn Xuân Hữu', N'HCM', N'Nam', CAST(N'2022-11-27T01:57:51.040' AS DateTime), N'nguyenxuanhuu12c3@gmail.com')
SET IDENTITY_INSERT [dbo].[ThongTin] OFF
GO
SET IDENTITY_INSERT [dbo].[Ve] ON 

INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (1, 1, 2, CAST(N'2021-12-02T10:03:26.3158384' AS DateTime2), CAST(380000.00 AS Decimal(18, 2)), 2, 4)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (2, 1, 2, CAST(N'2021-12-02T15:08:16.7137483' AS DateTime2), CAST(135000.00 AS Decimal(18, 2)), 5, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (3, 1, 1, CAST(N'2021-12-02T15:12:52.8394296' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 6, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (4, 1, 1, CAST(N'2021-12-02T15:15:12.2346701' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 7, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (5, 1, 1, CAST(N'2021-12-02T15:18:40.1135625' AS DateTime2), CAST(760000.00 AS Decimal(18, 2)), 8, 8)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (6, 1, 1, CAST(N'2021-12-02T15:21:06.5262622' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 9, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (7, 1, 1, CAST(N'2021-12-02T15:23:42.7930850' AS DateTime2), CAST(380000.00 AS Decimal(18, 2)), 10, 4)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (8, 1, 1, CAST(N'2021-12-02T15:36:11.9764559' AS DateTime2), CAST(190000.00 AS Decimal(18, 2)), 11, 2)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (9, 1, 2, CAST(N'2021-12-02T22:47:27.6051112' AS DateTime2), CAST(380000.00 AS Decimal(18, 2)), 12, 4)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (10, 8, 2, CAST(N'2021-12-04T11:32:22.9313867' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 13, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (11, 9, 2, CAST(N'2022-01-21T11:25:03.8188550' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 14, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (12, 9, 1, CAST(N'2022-01-21T11:35:28.9039162' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 15, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (13, 10, 2, CAST(N'2022-01-25T20:48:20.9241262' AS DateTime2), CAST(45000.00 AS Decimal(18, 2)), 16, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (14, 11, 2, CAST(N'2022-01-25T20:54:56.2737050' AS DateTime2), CAST(45000.00 AS Decimal(18, 2)), 17, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (15, 12, 2, CAST(N'2022-01-25T21:13:29.9692121' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 18, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (16, 12, 1, CAST(N'2022-01-25T21:27:33.7369392' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 19, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (17, 12, 1, CAST(N'2022-01-25T21:27:43.8789658' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 20, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (18, 13, 1, CAST(N'2022-11-27T01:51:30.2141546' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 21, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (19, 13, 1, CAST(N'2022-11-27T01:51:38.1345808' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 22, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (20, 13, 1, CAST(N'2022-11-27T01:51:42.7386484' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 23, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (21, 13, 1, CAST(N'2022-11-27T01:51:51.9686377' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 24, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (22, 15, 1, CAST(N'2022-11-27T01:58:29.2262478' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 25, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (23, 15, 1, CAST(N'2022-11-27T01:58:35.7141969' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 26, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (24, 1, 2, CAST(N'2022-11-27T02:10:14.0600745' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 27, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (25, 1, 2, CAST(N'2022-11-27T02:10:22.9387721' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 28, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (26, 1, 2, CAST(N'2022-11-27T02:10:31.8023420' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 29, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (27, 1, 2, CAST(N'2022-11-27T02:10:49.2768352' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 30, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (28, 1, 1, CAST(N'2022-11-27T02:14:22.6900556' AS DateTime2), CAST(190000.00 AS Decimal(18, 2)), 31, 2)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (29, 15, 1, CAST(N'2022-11-27T07:25:12.7569426' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 32, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (30, 15, 1, CAST(N'2022-11-27T07:25:41.6061290' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 33, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (31, 15, 1, CAST(N'2022-11-27T07:26:32.1282558' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 34, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (32, 15, 1, CAST(N'2022-11-27T07:29:57.3566194' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 38, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (33, 15, 1, CAST(N'2022-11-27T07:38:31.0016859' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 39, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (34, 15, 1, CAST(N'2022-11-27T07:38:36.3667916' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 40, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (35, 15, 1, CAST(N'2022-11-27T07:42:49.8664622' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 41, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (36, 15, 1, CAST(N'2022-11-27T07:49:01.0137866' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 42, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (37, 15, 1, CAST(N'2022-11-27T07:54:00.4275472' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 43, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (38, 15, 1, CAST(N'2022-11-27T08:02:32.5842753' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 44, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (39, 15, 1, CAST(N'2022-11-27T08:18:42.1695936' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 45, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (40, 15, 1, CAST(N'2022-11-27T08:18:46.3366965' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 46, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (41, 15, 1, CAST(N'2022-11-27T08:19:00.9660322' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 47, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (42, 15, 1, CAST(N'2022-11-27T08:21:07.5276733' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 48, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (43, 15, 1, CAST(N'2022-11-27T08:21:47.3997720' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 49, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (44, 15, 1, CAST(N'2022-11-27T16:51:16.9395534' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 50, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (45, 15, 1, CAST(N'2022-11-27T16:53:21.4056674' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 51, 1)
SET IDENTITY_INSERT [dbo].[Ve] OFF
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF__Phong__Daxoa__4BAC3F29]  DEFAULT (CONVERT([bit],(0),(0))) FOR [TrinhTrang]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_Phim] FOREIGN KEY([IdPhim])
REFERENCES [dbo].[Phim] ([Id])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_Phim]
GO
ALTER TABLE [dbo].[DanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_Phim] FOREIGN KEY([id_Phim])
REFERENCES [dbo].[Phim] ([Id])
GO
ALTER TABLE [dbo].[DanhMuc] CHECK CONSTRAINT [FK_DanhMuc_Phim]
GO
ALTER TABLE [dbo].[Ghe]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_LoaiGhe] FOREIGN KEY([Loai_id])
REFERENCES [dbo].[LoaiGhe] ([Id])
GO
ALTER TABLE [dbo].[Ghe] CHECK CONSTRAINT [FK_Ghe_LoaiGhe]
GO
ALTER TABLE [dbo].[Ghe]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_Phong] FOREIGN KEY([Id_phong])
REFERENCES [dbo].[Phong] ([Id])
GO
ALTER TABLE [dbo].[Ghe] CHECK CONSTRAINT [FK_Ghe_Phong]
GO
ALTER TABLE [dbo].[Ghe]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_Ve] FOREIGN KEY([Id_Ve])
REFERENCES [dbo].[Ve] ([Id])
GO
ALTER TABLE [dbo].[Ghe] CHECK CONSTRAINT [FK_Ghe_Ve]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Phim] FOREIGN KEY([IdPhim])
REFERENCES [dbo].[Phim] ([Id])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_Phim]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Phong] FOREIGN KEY([IdPhong])
REFERENCES [dbo].[Phong] ([Id])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_Phong]
GO
ALTER TABLE [dbo].[NoiDung]  WITH CHECK ADD  CONSTRAINT [FK_Bl_TK] FOREIGN KEY([Id_binhLuan])
REFERENCES [dbo].[BinhLuan] ([Id])
GO
ALTER TABLE [dbo].[NoiDung] CHECK CONSTRAINT [FK_Bl_TK]
GO
ALTER TABLE [dbo].[NoiDung]  WITH CHECK ADD  CONSTRAINT [FK_TK_BL] FOREIGN KEY([Id_TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([Id])
GO
ALTER TABLE [dbo].[NoiDung] CHECK CONSTRAINT [FK_TK_BL]
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD  CONSTRAINT [FK_Phim_LoaiPhim] FOREIGN KEY([IdLoaiPhim])
REFERENCES [dbo].[LoaiPhim] ([Id])
GO
ALTER TABLE [dbo].[Phim] CHECK CONSTRAINT [FK_Phim_LoaiPhim]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_Rap] FOREIGN KEY([IdRapChieu])
REFERENCES [dbo].[RapPhim] ([Id])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_Rap]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_ThongTin] FOREIGN KEY([id_ThongTin])
REFERENCES [dbo].[ThongTin] ([ThongTin_id])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_ThongTin]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_LichChieu] FOREIGN KEY([Id_LichChieu])
REFERENCES [dbo].[LichChieu] ([Id])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_LichChieu]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_Rap] FOREIGN KEY([IdRap])
REFERENCES [dbo].[RapPhim] ([Id])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_Rap]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_TaiKhoan] FOREIGN KEY([IdTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([Id])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_TaiKhoan]
GO
USE [master]
GO
ALTER DATABASE [phim] SET  READ_WRITE 
GO
