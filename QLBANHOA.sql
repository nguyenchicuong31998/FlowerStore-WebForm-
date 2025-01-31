USE [master]
GO
/****** Object:  Database [QLBANHOA]    Script Date: 11/12/2018 8:31:16 AM ******/
CREATE DATABASE [QLBANHOA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBANHOA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CUONG\MSSQL\DATA\QLBANHOA.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBANHOA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CUONG\MSSQL\DATA\QLBANHOA_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBANHOA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBANHOA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBANHOA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBANHOA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBANHOA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBANHOA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBANHOA] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBANHOA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLBANHOA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLBANHOA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBANHOA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBANHOA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBANHOA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBANHOA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBANHOA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBANHOA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBANHOA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBANHOA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBANHOA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBANHOA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBANHOA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBANHOA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBANHOA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBANHOA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBANHOA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBANHOA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBANHOA] SET  MULTI_USER 
GO
ALTER DATABASE [QLBANHOA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBANHOA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBANHOA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBANHOA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLBANHOA]
GO
/****** Object:  StoredProcedure [dbo].[ANHQC]    Script Date: 11/12/2018 8:31:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ANHQC](
	@THUTUQC INT,
	@TRANGTHAI BIT
) 
AS
BEGIN
    SELECT ANH FROM QUANGCAO WHERE THUTUQC=@THUTUQC AND TRANGTHAI=@TRANGTHAI
END
GO
/****** Object:  StoredProcedure [dbo].[SUAADMIN]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUAADMIN](
	@MAAD INT,
	@TENAD NVARCHAR(50),
	@NGAYSINH SMALLDATETIME,
	@GIOITINH BIT,
	@DIACHI NVARCHAR(100),	
    @DIENTHOAI VARCHAR(15),
	@EMAIL VARCHAR(50),
	@TENDN VARCHAR(30),
	@MATKHAU VARCHAR(30),
	@QUYENADMIN INT
)
AS
BEGIN
 UPDATE ADMIN
 SET TENAD=@TENAD,NGAYSINH=@NGAYSINH,GIOITINH=@GIOITINH,DIACHI=@DIACHI,DIENTHOAI=@DIENTHOAI,EMAIL=@EMAIL,TENDN=@TENDN,MATKHAU=@MATKHAU,QUYENADMIN=@QUYENADMIN
 WHERE MAAD=@MAAD
END
GO
/****** Object:  StoredProcedure [dbo].[SUADANHGIA]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUADANHGIA](
   @ID INT,
   @SAO SMALLINT,
   @MAHOA Int

)
AS
BEGIN
 UPDATE DANHGIA
 SET SAO=@SAO,MAHOA=@MAHOA
 WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SUADANHMUC]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUADANHMUC](
   @MADMH VARCHAR(5),
   @ID INT,
   @TENDMCON NVARCHAR(50),
   @MADM VARCHAR(5),
   @HIDEN bit
)
AS
BEGIN
 UPDATE DANHMUCCON
 SET ID=@ID,TENDMCON=@TENDMCON,MADM=@MADM,HIDEN=@HIDEN
 WHERE MADMH=@MADMH
END
----STORE THANH TOÁN-----

GO
/****** Object:  StoredProcedure [dbo].[SUAHOA]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUAHOA](
	@MAHOA INT,
	@TENHOA NVARCHAR(30),
	@XUATSU NVARCHAR(30),
	@DONGIA DECIMAL(20,2),
	@MOTA NVARCHAR(500),
	@ANHHOA VARCHAR(100),
	@MADMH VARCHAR(5),
	@NGAYCAPNHAT SMALLDATETIME,
	@TONGSOLUONG INT,
	@SOLANXEM INT
)
AS
BEGIN
 UPDATE HOA
 SET TENHOA=@TENHOA,XUATSU=@XUATSU,DONGIA=@DONGIA,MOTA=@MOTA,ANHHOA=@ANHHOA,MADMH=@MADMH,NGAYCAPNHAT=@NGAYCAPNHAT,TONGSOLUONG=@TONGSOLUONG,SOLANXEM=@SOLANXEM
 WHERE MAHOA=@MAHOA
END

GO
/****** Object:  StoredProcedure [dbo].[SUAKHACHHANG]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUAKHACHHANG](
	@MAKH INT,
	@TENKH NVARCHAR(50),
	@DIACHI NVARCHAR(200),
	@NGAYSINH SMALLDATETIME,
	@GIOITINH INT,
	@EMAIL VARCHAR(100),
	@TENDN VARCHAR(25),
	@MATKHAU VARCHAR(25)
)
AS
BEGIN
 UPDATE KHACHHANG
 SET TENKH=@TENKH,DIACHI=@DIACHI,NGAYSINH=@NGAYSINH,GIOITINH=@GIOITINH,EMAIL=@EMAIL,TENDN=@TENDN,MATKHAU=@MATKHAU
 WHERE MAKH=@MAKH
END



GO
/****** Object:  StoredProcedure [dbo].[SUALOGOBANNER]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUALOGOBANNER](
	@IDQC INT,
	@TENQC NVARCHAR(250),
	@ANH VARCHAR(200),
	@HREF VARCHAR(200),
	@NGAYBATDAU SMALLDATETIME,
	@NGAYKETTHUC SMALLDATETIME,
	@THUTUQC INT,
	@TRANGTHAI BIT
)
AS
BEGIN
 UPDATE QUANGCAO
 SET TENQC=@TENQC,ANH=@ANH,HREF=@HREF,NGAYBATDAU=@NGAYBATDAU,NGAYKETTHUC=@NGAYKETTHUC,THUTUQC=@THUTUQC,TRANGTHAI=@TRANGTHAI
 WHERE IDQC=@IDQC
END

GO
/****** Object:  StoredProcedure [dbo].[SUAMENU]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUAMENU](
   @ID INT,
   @MADM VARCHAR(5),
   @TENDM NVARCHAR(30),
   @HREF VARCHAR(50),
   @HIDEN bit
)
AS
BEGIN
 UPDATE DANHMUCHOA
 SET MADM=@MADM,TENDM=@TENDM,HREF=@HREF,HIDEN=@HIDEN
 WHERE ID=@ID
END

-----STORE DANHMUC-----------

GO
/****** Object:  StoredProcedure [dbo].[SUATINTUC]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUATINTUC](
   @MATT INT,
   @MAAD INT,
   @TIEUDE NVARCHAR(200),
   @NOIDUNG NVARCHAR(2000),
   @NGAYDANG SMALLDATETIME,
   @LUOTXEM int
)
AS
BEGIN
 UPDATE TINTUC
 SET MAAD=@MAAD,TIEUDE=@TIEUDE,NOIDUNG=@NOIDUNG,NGAYDANG=@NGAYDANG,LUOTXEM=@LUOTXEM
 WHERE MATT=@MATT
END
GO
/****** Object:  StoredProcedure [dbo].[SUATTKHACHHANG]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SUATTKHACHHANG](
	@MAKH INT,
	@TENKH NVARCHAR(50),
	@DIACHI NVARCHAR(200),
	@NGAYSINH SMALLDATETIME,
	@GIOITINH INT,
	@EMAIL VARCHAR(100)
)
AS
BEGIN
 UPDATE KHACHHANG
 SET TENKH=@TENKH,DIACHI=@DIACHI,NGAYSINH=@NGAYSINH,GIOITINH=@GIOITINH,EMAIL=@EMAIL
 WHERE MAKH=@MAKH
END

-----STORE MENU----------

GO
/****** Object:  StoredProcedure [dbo].[THANHTOAN]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THANHTOAN](
		@MAKH INT,
		@NGAYDATHANG SMALLDATETIME,
		@TRIGIA DECIMAL(20,0),
		@TENNGUOINHAN NVARCHAR(50),
		@DIENTHOAI VARCHAR(15),
		@DIACHI NVARCHAR(200),
		@HTTHANHTOAN NVARCHAR(100),
		@HTGIAOHANG NVARCHAR(100),
		@TRANGTHAI bit
)
AS
BEGIN 
  INSERT INTO DONDATHANG(MAKH,NGAYDATHANG,TRIGIA,TENNGUOINHAN,DIENTHOAI,DIACHI,HTTHANHTOAN,HTGIAOHANG,TRANGTHAI)
  VALUES(@MAKH,@NGAYDATHANG,@TRIGIA,@TENNGUOINHAN,@DIENTHOAI,@DIACHI,@HTTHANHTOAN,@HTGIAOHANG,@TRANGTHAI)
END

GO
/****** Object:  StoredProcedure [dbo].[THEMADMIN]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THEMADMIN](
	@TENAD NVARCHAR(50),
	@NGAYSINH SMALLDATETIME,
	@GIOITINH BIT,
	@DIACHI NVARCHAR(100),	
    @DIENTHOAI VARCHAR(15),
	@EMAIL VARCHAR(50),
	@TENDN VARCHAR(30),
	@MATKHAU VARCHAR(30),
	@QUYENADMIN INT
)
AS
BEGIN
  INSERT INTO ADMIN(TENAD,NGAYSINH,GIOITINH,DIACHI,DIENTHOAI,EMAIL,TENDN,MATKHAU,QUYENADMIN) 
  VALUES(@TENAD,@NGAYSINH,@GIOITINH,@DIACHI,@DIENTHOAI,@EMAIL,@TENDN,@MATKHAU,@QUYENADMIN)
END
GO
/****** Object:  StoredProcedure [dbo].[THEMDANHMUC]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THEMDANHMUC](
	@MADMH VARCHAR(5),
	@ID INT,
	@TENDMCON NVARCHAR(50),
	@MADM VARCHAR(5),
	@HIDEN bit
)
AS
BEGIN
   INSERT INTO DANHMUCCON(MADMH,ID,TENDMCON,MADM,HIDEN) 
  VALUES(@MADMH,@ID,@TENDMCON,@MADM,@HIDEN)
END

GO
/****** Object:  StoredProcedure [dbo].[THEMHOA]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THEMHOA](
	@TENHOA NVARCHAR(30),
	@XUATSU NVARCHAR(30),
	@DONGIA DECIMAL(20,2),
	@MOTA NVARCHAR(500),
	@ANHHOA VARCHAR(100),
	@MADMH VARCHAR(5),
	@NGAYCAPNHAT SMALLDATETIME,
	@TONGSOLUONG INT,
	@SOLANXEM INT
)
AS
BEGIN
  INSERT INTO HOA(TENHOA,XUATSU,DONGIA,MOTA,ANHHOA,MADMH,NGAYCAPNHAT,TONGSOLUONG,SOLANXEM) 
  VALUES(@TENHOA,@XUATSU,@DONGIA,@MOTA,@ANHHOA,@MADMH,@NGAYCAPNHAT,@TONGSOLUONG,@SOLANXEM)
END

GO
/****** Object:  StoredProcedure [dbo].[THEMKHACHHANG]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THEMKHACHHANG](
	@TENKH NVARCHAR(50),
	@DIACHI NVARCHAR(200),
	@NGAYSINH SMALLDATETIME,
	@GIOITINH INT,
	@EMAIL VARCHAR(100),
	@TENDN VARCHAR(25),
	@MATKHAU VARCHAR(25)
)
AS
BEGIN
  INSERT INTO KHACHHANG(TENKH,DIACHI,NGAYSINH,GIOITINH,EMAIL,TENDN,MATKHAU) 
  VALUES(@TENKH,@DIACHI,@NGAYSINH,@GIOITINH,@EMAIL,@TENDN,@MATKHAU)
END
GO
/****** Object:  StoredProcedure [dbo].[THEMLOGOBANNER]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THEMLOGOBANNER](
	@TENQC NVARCHAR(250),
	@ANH VARCHAR(200),
	@HREF VARCHAR(200),
	@NGAYBATDAU SMALLDATETIME,
	@NGAYKETTHUC SMALLDATETIME,
	@THUTUQC INT,
	@TRANGTHAI BIT
)
AS
BEGIN
  INSERT INTO QUANGCAO(TENQC,ANH,HREF,NGAYBATDAU,NGAYKETTHUC,THUTUQC,TRANGTHAI) 
  VALUES(@TENQC,@ANH,@HREF,@NGAYBATDAU,@NGAYKETTHUC,@THUTUQC,@TRANGTHAI)
END
--SELECT TOP 12 * FROM HOA WHERE DATEDIFF(DAY,NGAYCAPNHAT,GETDATE())<5 ;	

---STORE KHACHHANG--------

GO
/****** Object:  StoredProcedure [dbo].[THEMMENU]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THEMMENU](
	@MADM VARCHAR(5),
	@TENDM NVARCHAR(30),
	@HREF VARCHAR(50),
	@HIDEN BIT
)
AS
BEGIN
   INSERT INTO DANHMUCHOA(MADM,TENDM,HREF,HIDEN) 
  VALUES(@MADM,@TENDM,@HREF,@HIDEN)
END

GO
/****** Object:  StoredProcedure [dbo].[THEMNHANXET]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----STORE BINH LUAN----------
CREATE PROC [dbo].[THEMNHANXET](
	@MAKH INT,
	@MAHOA INT,
	@HOTENKH NVARCHAR(50),
	@NGAYGIO SMALLDATETIME,
	@NOIDUNGBL NVARCHAR(1000)
)
AS
BEGIN
  INSERT INTO BINHLUAN(MAKH,MAHOA,HOTENKH,NGAYGIO,NOIDUNGBL) 
  VALUES(@MAKH,@MAHOA,@HOTENKH,@NGAYGIO,@NOIDUNGBL)
END
-----STORE LOGO BANNER----------

GO
/****** Object:  StoredProcedure [dbo].[THEMTINTUC]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THEMTINTUC](
   @MAAD INT,
   @TIEUDE NVARCHAR(200),
   @NOIDUNG NVARCHAR(2000),
   @NGAYDANG SMALLDATETIME,
   @LUOTXEM int
)
AS
BEGIN
   INSERT INTO TINTUC(MAAD,TIEUDE,NOIDUNG,NGAYDANG,LUOTXEM) 
  VALUES(@MAAD,@TIEUDE,@NOIDUNG,@NGAYDANG,@LUOTXEM)
END
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MAAD] [int] IDENTITY(1,1) NOT NULL,
	[TENAD] [nvarchar](50) NULL,
	[NGAYSINH] [smalldatetime] NULL,
	[GIOITINH] [int] NULL,
	[DIACHI] [nvarchar](100) NULL,
	[DIENTHOAI] [varchar](15) NULL,
	[EMAIL] [varchar](50) NULL,
	[TENDN] [varchar](30) NULL,
	[MATKHAU] [varchar](30) NULL,
	[QUYENADMIN] [int] NULL,
 CONSTRAINT [PK__ADMIN__603F086882B0E1BC] PRIMARY KEY CLUSTERED 
(
	[MAAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BINHLUAN]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BINHLUAN](
	[MABL] [int] IDENTITY(1,1) NOT NULL,
	[MAKH] [int] NULL,
	[MAHOA] [int] NULL,
	[HOTENKH] [nvarchar](50) NULL,
	[NGAYGIO] [smalldatetime] NULL,
	[NOIDUNGBL] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MABL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDATHANG]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDATHANG](
	[MADH] [int] NOT NULL,
	[MAHOA] [int] NOT NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [decimal](20, 0) NULL,
	[THANHTIEN] [decimal](20, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MADH] ASC,
	[MAHOA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DANHGIA]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SAO] [smallint] NULL,
	[MAHOA] [int] NULL,
 CONSTRAINT [PK__DANHGIA__3214EC2782CF4F37] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DANHMUCCON]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DANHMUCCON](
	[MADMH] [varchar](5) NOT NULL,
	[ID] [int] NULL,
	[TENDMCON] [nvarchar](50) NULL,
	[MADM] [varchar](5) NULL,
	[HIDEN] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MADMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DANHMUCHOA]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DANHMUCHOA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MADM] [varchar](5) NULL,
	[TENDM] [nvarchar](30) NULL,
	[HREF] [varchar](50) NULL,
	[HIDEN] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MADH] [int] IDENTITY(1,1) NOT NULL,
	[MAKH] [int] NULL,
	[NGAYDATHANG] [smalldatetime] NULL,
	[TRIGIA] [decimal](20, 0) NULL,
	[NGAYGIAOHANG] [smalldatetime] NULL,
	[TENNGUOINHAN] [nvarchar](50) NULL,
	[DIENTHOAI] [varchar](15) NULL,
	[DIACHI] [nvarchar](200) NULL,
	[HTTHANHTOAN] [nvarchar](100) NULL,
	[HTGIAOHANG] [nvarchar](100) NULL,
	[TRANGTHAI] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MADH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOA]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOA](
	[MAHOA] [int] IDENTITY(1,1) NOT NULL,
	[TENHOA] [nvarchar](30) NULL,
	[XUATSU] [nvarchar](30) NULL,
	[DONGIA] [decimal](20, 0) NULL,
	[MOTA] [nvarchar](500) NULL,
	[ANHHOA] [varchar](100) NULL,
	[MADMH] [varchar](5) NOT NULL,
	[NGAYCAPNHAT] [smalldatetime] NULL,
	[TONGSOLUONG] [int] NULL,
	[SOLANXEM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHOA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MAKH] [int] IDENTITY(1,1) NOT NULL,
	[TENKH] [nvarchar](50) NULL,
	[DIACHI] [nvarchar](200) NULL,
	[NGAYSINH] [smalldatetime] NULL,
	[GIOITINH] [int] NULL,
	[EMAIL] [varchar](100) NULL,
	[TENDN] [varchar](25) NULL,
	[MATKHAU] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUANGCAO]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUANGCAO](
	[IDQC] [int] IDENTITY(1,1) NOT NULL,
	[TENQC] [nvarchar](250) NULL,
	[ANH] [varchar](200) NULL,
	[HREF] [varchar](200) NULL,
	[NGAYBATDAU] [smalldatetime] NULL,
	[NGAYKETTHUC] [smalldatetime] NULL,
	[THUTUQC] [int] NULL,
	[TRANGTHAI] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDQC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[MATT] [int] IDENTITY(1,1) NOT NULL,
	[MAAD] [int] NOT NULL,
	[TIEUDE] [nvarchar](200) NULL,
	[NOIDUNG] [nvarchar](2000) NULL,
	[NGAYDANG] [smalldatetime] NULL,
	[LUOTXEM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MATT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YNGHIAHOA]    Script Date: 11/12/2018 8:31:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YNGHIAHOA](
	[IDYN] [int] IDENTITY(1,1) NOT NULL,
	[TIEUDE] [nvarchar](200) NULL,
	[ANH] [varchar](100) NULL,
	[MOTA] [nvarchar](250) NULL,
	[NOIDUNG] [nvarchar](2000) NULL,
	[NGAYDANG] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDYN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([MAAD], [TENAD], [NGAYSINH], [GIOITINH], [DIACHI], [DIENTHOAI], [EMAIL], [TENDN], [MATKHAU], [QUYENADMIN]) VALUES (1, N'Nguyễn Chí Cường', CAST(0x8C230000 AS SmallDateTime), 0, N'Phú Lợi', N'0972612445', N'nguyenchicuong31998@gmail.com', N'nguyenchicuong', N'1', 1)
INSERT [dbo].[ADMIN] ([MAAD], [TENAD], [NGAYSINH], [GIOITINH], [DIACHI], [DIENTHOAI], [EMAIL], [TENDN], [MATKHAU], [QUYENADMIN]) VALUES (2, N'Nguyễn Chí Bảo', CAST(0x80610000 AS SmallDateTime), 0, N'Phú hòa', N'0908135210', N'nguyenchibao@gmail.com', N'nguyenchibao', N'12', 1)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
SET IDENTITY_INSERT [dbo].[BINHLUAN] ON 

INSERT [dbo].[BINHLUAN] ([MABL], [MAKH], [MAHOA], [HOTENKH], [NGAYGIO], [NOIDUNGBL]) VALUES (1, 1, 10, N'Nguyễn Chí Cường', CAST(0xA9AA0567 AS SmallDateTime), N'Hoa đẹp')
INSERT [dbo].[BINHLUAN] ([MABL], [MAKH], [MAHOA], [HOTENKH], [NGAYGIO], [NOIDUNGBL]) VALUES (2, 1, 10, N'Nguyễn Chí Cường', CAST(0xA9B301E8 AS SmallDateTime), N'Sản này đẹp')
SET IDENTITY_INSERT [dbo].[BINHLUAN] OFF
INSERT [dbo].[CTDATHANG] ([MADH], [MAHOA], [SOLUONG], [DONGIA], [THANHTIEN]) VALUES (1, 1, 1, CAST(200000 AS Decimal(20, 0)), NULL)
INSERT [dbo].[CTDATHANG] ([MADH], [MAHOA], [SOLUONG], [DONGIA], [THANHTIEN]) VALUES (1, 10, 2, CAST(1200000 AS Decimal(20, 0)), NULL)
INSERT [dbo].[CTDATHANG] ([MADH], [MAHOA], [SOLUONG], [DONGIA], [THANHTIEN]) VALUES (2, 10, 1, CAST(1200000 AS Decimal(20, 0)), NULL)
INSERT [dbo].[CTDATHANG] ([MADH], [MAHOA], [SOLUONG], [DONGIA], [THANHTIEN]) VALUES (3, 10, 3, CAST(1200000 AS Decimal(20, 0)), NULL)
SET IDENTITY_INSERT [dbo].[DANHGIA] ON 

INSERT [dbo].[DANHGIA] ([ID], [SAO], [MAHOA]) VALUES (1, 5, 10)
INSERT [dbo].[DANHGIA] ([ID], [SAO], [MAHOA]) VALUES (3, 4, 10)
SET IDENTITY_INSERT [dbo].[DANHGIA] OFF
INSERT [dbo].[DANHMUCCON] ([MADMH], [ID], [TENDMCON], [MADM], [HIDEN]) VALUES (N'HB', 4, N'Hoa Bó', N'SP', 1)
INSERT [dbo].[DANHMUCCON] ([MADMH], [ID], [TENDMCON], [MADM], [HIDEN]) VALUES (N'HC', 2, N'Hoa Cưới', N'SP', 1)
INSERT [dbo].[DANHMUCCON] ([MADMH], [ID], [TENDMCON], [MADM], [HIDEN]) VALUES (N'HKT', 3, N'Hoa Khai Trương', N'SP', 1)
INSERT [dbo].[DANHMUCCON] ([MADMH], [ID], [TENDMCON], [MADM], [HIDEN]) VALUES (N'HSN', 1, N'Hoa Sinh Nhật', N'SP', 1)
SET IDENTITY_INSERT [dbo].[DANHMUCHOA] ON 

INSERT [dbo].[DANHMUCHOA] ([ID], [MADM], [TENDM], [HREF], [HIDEN]) VALUES (1, N'TC', N'TRANG CHỦ', N'TrangChu.aspx', 1)
INSERT [dbo].[DANHMUCHOA] ([ID], [MADM], [TENDM], [HREF], [HIDEN]) VALUES (2, N'SP', N'SẢN PHẨM', N'', 1)
INSERT [dbo].[DANHMUCHOA] ([ID], [MADM], [TENDM], [HREF], [HIDEN]) VALUES (3, N'GT', N'GIỚI THIỆU', N'GioiThieu.aspx', 1)
INSERT [dbo].[DANHMUCHOA] ([ID], [MADM], [TENDM], [HREF], [HIDEN]) VALUES (4, N'TT', N'TIN TỨC', N'TinTuc.aspx', 1)
SET IDENTITY_INSERT [dbo].[DANHMUCHOA] OFF
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([MADH], [MAKH], [NGAYDATHANG], [TRIGIA], [NGAYGIAOHANG], [TENNGUOINHAN], [DIENTHOAI], [DIACHI], [HTTHANHTOAN], [HTGIAOHANG], [TRANGTHAI]) VALUES (1, 1, CAST(0xA9AB0000 AS SmallDateTime), CAST(2600000 AS Decimal(20, 0)), NULL, N'Nguyễn Chí Cường', N'0908135210', N'Phú Lợi', N'Thanh toán sau khi giao hàng', N'Giao trực tiếp', 0)
INSERT [dbo].[DONDATHANG] ([MADH], [MAKH], [NGAYDATHANG], [TRIGIA], [NGAYGIAOHANG], [TENNGUOINHAN], [DIENTHOAI], [DIACHI], [HTTHANHTOAN], [HTGIAOHANG], [TRANGTHAI]) VALUES (2, 1, CAST(0xA9AD0000 AS SmallDateTime), CAST(1200000 AS Decimal(20, 0)), NULL, N'Nguyễn Chí Cường', N'0908135210', N'Phú Lợi', N'Thanh toán sau khi giao hàng', N'Giao trực tiếp', 0)
INSERT [dbo].[DONDATHANG] ([MADH], [MAKH], [NGAYDATHANG], [TRIGIA], [NGAYGIAOHANG], [TENNGUOINHAN], [DIENTHOAI], [DIACHI], [HTTHANHTOAN], [HTGIAOHANG], [TRANGTHAI]) VALUES (3, 1, CAST(0xA9B30000 AS SmallDateTime), CAST(3600000 AS Decimal(20, 0)), NULL, N'Nguyễn Chí Cường', N'0908135210', N'Phú Lợi 1', N'Thanh toán bằng Bảo kim', N'Giao trực tiếp', 0)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
SET IDENTITY_INSERT [dbo].[HOA] ON 

INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (1, N'Mong Manh', N'', CAST(200000 AS Decimal(20, 0)), N'<p>Một đ&oacute;a hoa hồng l&agrave; một gợi &yacute; tuyệt vời cho lời nhắn &quot; Anh y&ecirc;u em&quot; đầy ngọt ng&agrave;o v&agrave; dễ thương. Y&ecirc;u thương l&agrave; lu&ocirc;n chia sẻ, quan t&acirc;m v&agrave; thấu hiểu người m&igrave;nh thương bạn nh&eacute;. Đừng chần chừ m&agrave; h&atilde;y gửi đến họ một ch&uacute;t y&ecirc;u thương đầy ch&acirc;n th&agrave;nh nhất c&ugrave;ng đ&oacute;a hồng đỏ được t&ocirc; điểm bằng những loại hoa phụ dễ thương kh&aacute;c nh&eacute;.</p>
', N'mongmanhhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 5)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (2, N'Mặt Trời Bé Con', N'', CAST(300000 AS Decimal(20, 0)), N'<p>Kh&ocirc;ng mang trong m&igrave;nh n&eacute;t ki&ecirc;u sa, lộng lẫy nhưng hướng dương mang đến một vẻ đẹp đầy tươi s&aacute;ng v&agrave; rạng ngời. Hướng dương cũng l&agrave; một lựa chon s&aacute;ng suốt cho ng&agrave;y tốt nghiệp của bạn b&egrave;, người th&acirc;n như một lời ch&uacute;c mừng cho một tương lai đầy tươi s&aacute;ng, rộng mở v&agrave; đầy may mắn.</p>
', N'mattroibeconhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 7)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (3, N'Luôn Bên Em', N'', CAST(360000 AS Decimal(20, 0)), N'<p>Giữa cuộc sống với bao nhi&ecirc;u kh&oacute; khăn, căng thẳng v&agrave; tấp nập, một ch&uacute;t nhẹ nh&agrave;ng, hồn nhi&ecirc;n của đ&oacute;a hồng d&acirc;u chắc chắn sẽ mang đến niềm vui kh&oacute; tả cho một ai đ&oacute;. Sống chậm lại v&agrave; y&ecirc;u thương nhiều hơn, chia sẻ nhiều hơn v&agrave; quan t&acirc;m nhiều hơn, h&atilde;y để b&oacute; hồng n&agrave;y gi&uacute;p bạn gửi đi th&ocirc;ng điệp đ&oacute; nh&eacute;.</p>
', N'luonbenemhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 4)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (4, N'Thu Sang', N'', CAST(360000 AS Decimal(20, 0)), N'<p>B&oacute; hoa l&agrave; sự kết hợp của nhiều lo&agrave;i hoa với nhiều loại m&agrave;u sắc kh&aacute;c nhau như đồng tiền, hồng, c&aacute;t tường v&agrave; c&aacute;c loại hoa l&aacute; phụ nh&iacute; dễ thương kh&aacute;c chắc chắn sẽ mang đến cho bạn v&agrave; những người th&acirc;n y&ecirc;u một ng&agrave;y đầy m&agrave;u sắc, cung bậc v&agrave; đong đầy y&ecirc;u thương đấy. Bạn c&ograve;n chờ g&igrave; nữa m&agrave; kh&ocirc;ng đặt hoa ngay b&acirc;y giờ?</p>
', N'thusanghb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 2)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (5, N'Thanh Xuân', N'', CAST(430000 AS Decimal(20, 0)), N'<p>Thanh lịch v&agrave; đầy tinh tế, b&oacute; hoa được kết hợp từ hoa hồng, đồng tiền c&ugrave;ng mang một t&ocirc;ng m&agrave;u pastel đầy ngọt ng&agrave;o, dễ thương v&agrave; g&oacute;i theo phong c&aacute;ch cực trendy sẽ gi&uacute;p bạn gửi những lời y&ecirc;u thương đầy tinh tế đến người con g&aacute;i đầy c&aacute; t&iacute;nh ấy đ&oacute;.</p>
', N'thanhxuanhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 2)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (6, N'Ngọt Như Kẹo', N'', CAST(500000 AS Decimal(20, 0)), N'<p>B&oacute; hoa mang phong c&aacute;ch vintage c&ugrave;ng sự kết hợp mới lạ giữa sao t&iacute;m, baby v&agrave; hồng d&acirc;u mang lại một m&oacute;n qu&agrave; dễ thương, hiện đại v&agrave; cực tinh tế. H&atilde;y trao gửi y&ecirc;u thương một c&aacute;ch đầy ngọt ng&agrave;o v&agrave; ch&acirc;n th&agrave;nh bạn nh&eacute;.</p>
', N'ngotnhukeohb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 5)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (7, N'Nơi Tình Yêu Bắt Đầu', N'', CAST(600000 AS Decimal(20, 0)), N'<p>B&oacute; hoa được thiết kế với t&ocirc;ng m&agrave;u hồng đ&aacute;ng y&ecirc;u v&agrave; trắng tinh kh&ocirc;i gợi nhắc cho ta nhớ đến một chiều m&ugrave;a thu trong trẻo, tinh kh&ocirc;i. Một ng&agrave;y c&oacute; nắng, c&oacute; gi&oacute;, c&oacute; cả m&acirc;y v&agrave; sương, anh đ&atilde; được gặp em.</p>
', N'noitinhyeubatdauhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (8, N'Tình Đầu', N'', CAST(700000 AS Decimal(20, 0)), N'<p>Kh&ocirc;ng g&igrave; &yacute; nghĩa hơn khi tặng cho những người quan trọng trong cuộc đời ch&uacute;ng ta những c&aacute;nh hoa xinh đẹp v&agrave; tươi s&aacute;ng nhất. B&oacute; hoa l&agrave; sự kết hợp giữa những gam m&agrave;u tươi s&aacute;ng của hồng, c&aacute;t tường v&agrave; xen lẫn những c&agrave;nh lavender thơm ng&aacute;t, chắc chắn sẽ khiến người ấy ngất ng&acirc;y cả ng&agrave;y đấy.</p>
', N'tinhdauhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (9, N'Đôi Ta', N'', CAST(780000 AS Decimal(20, 0)), N'<p>Nếu bạn y&ecirc;u một người n&agrave;o đ&oacute;, h&atilde;y n&oacute;i y&ecirc;u đi đừng chờ đợi nh&eacute;, biết đ&acirc;u người ta cũng đang chờ đợi một lời ngỏ lời của bạn đấy. B&oacute; hồng đỏ rực rỡ v&agrave; tươi đẹp c&ugrave;ng cặp gấu nhỏ xinh v&agrave; dể thương sẽ gi&uacute;p bạn gửi lời ngỏ lời đầy ngọt ng&agrave;o m&agrave; th&agrave;nh t&acirc;m lắm đ&oacute;. V&agrave; biết đ&acirc;u bạn sẽ nhận được một ch&uacute;t bất ngờ sau khi tặng b&oacute; hoa n&agrave;y?</p>
', N'doitahb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (10, N'Tình Yêu Xanh', N'', CAST(1200000 AS Decimal(20, 0)), N'<p>Nếu hồng đỏ kh&ocirc;ng phải l&agrave; t&ocirc;ng m&agrave;u y&ecirc;u th&iacute;ch của bạn, một b&oacute; hồng xanh sẽ l&agrave; lựa chọn tuyệt vời v&agrave; đầy th&uacute; vị đ&oacute;. Mang sắc xanh tươi m&aacute;t v&agrave; mang lại nhiều điều may mắn, b&oacute; hoa hồng xanh 100 b&ocirc;ng l&agrave; c&aacute;ch gửi đi những lời y&ecirc;u thương, những quan t&acirc;m ch&acirc;n th&agrave;nh một c&aacute;ch đầy ngọt ng&agrave;o m&agrave; c&aacute; t&iacute;nh.</p>', N'tinhyeuxanhhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 96, 37)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (11, N'Sắc Tím', N'', CAST(1300000 AS Decimal(20, 0)), N'<p>B&oacute; hoa hồng t&iacute;m mang t&ocirc;ng m&agrave;u vintage với 1 c&aacute;nh hồng đỏ ngay giữa tượng trưng cho lời th&ocirc;ng điệp &quot;Anh y&ecirc;u em v&agrave; em l&agrave; t&igrave;nh y&ecirc;u duy nhất trong cuộc đời anh&quot;. D&ugrave; cho c&oacute; kh&oacute; khăn xảy ra, ta vẫn lu&ocirc;n c&oacute; nhau s&aacute;t c&aacute;nh. Nhanh tay gửi th&ocirc;ng điệp n&agrave;y đến cho người con g&aacute;i bạn y&ecirc;u nh&eacute;.</p>
', N'sactimhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 7)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (12, N'Dành Riêng Em', N'', CAST(800000 AS Decimal(20, 0)), N'<p>Đối với những c&ocirc; n&agrave;ng y&ecirc;u hoa v&agrave; lu&ocirc;n cập nhật xu hướng th&igrave; một b&oacute; hoa mẫu đơn l&agrave; m&oacute;n qu&agrave; tuyệt vời nhất. Hoa mẫu đơn l&agrave; loại hoa cao cấp được nhập khẩu v&agrave; l&agrave; biểu tượng của sự thịnh vượng, gi&agrave;u sang v&agrave; vẻ đẹp sang trọng nhất. H&atilde;y gửi người bạn y&ecirc;u b&oacute; hoa n&agrave;y v&agrave; mang đến một ng&agrave;y sinh nhật thật hạnh ph&uacute;c cho họ nh&eacute;.</p>
', N'danhriengemhb.jpg', N'HB', CAST(0xA9A90000 AS SmallDateTime), 100, 8)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (13, N'Thành Công', N'', CAST(740000 AS Decimal(20, 0)), N'<p>Hộp hoa l&agrave; sự kết hợp giữa t&ocirc;ng m&agrave;u hồng tinh tế v&agrave; t&ocirc;ng v&agrave;ng đầy tươi s&aacute;ng từ những c&aacute;nh hoa hồng d&acirc;u, hướng dương v&agrave; lan. Trong những dịp khai trương, kỉ niệm, ch&uacute;c mừng h&atilde;y gửi đến bạn b&egrave;, đối t&aacute;c, đồng nghiệp lời ch&uacute;c may mắn đầy h&acirc;n hoan v&agrave; ch&acirc;n th&agrave;nh nhất th&ocirc;ng qua hộp hoa đầy sắc m&agrave;u n&agrave;y nh&eacute;.</p>
', N'thanhcongkt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (14, N'Hương Sen', N'', CAST(750000 AS Decimal(20, 0)), N'<p>Hoa sen lu&ocirc;n được y&ecirc;u th&iacute;ch bởi vẻ đẹp tinh tế, cao qu&yacute; v&agrave; tượng trưng cho những g&igrave; ho&agrave;n hảo, tốt đẹp v&agrave; thanh cao nhất. Một lẵng hoa sen l&agrave; một m&oacute;n qu&agrave; sinh nhật, ch&uacute;c mừng đầy nhẹ nh&agrave;ng m&agrave; &yacute; nghĩa.</p>
', N'huongsenkt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (15, N'Hương Sen Hồng', N'', CAST(850000 AS Decimal(20, 0)), N'<p>N&eacute;t đặc biệt của hoa sen ch&iacute;nh l&agrave; nằm ở vẻ đẹp đầy thanh tao v&agrave; tinh tế nhưng cũng đầy mạnh mẽ. Một lẵng hoa từ hoa sen thay cho một lời nhắn d&ugrave; c&oacute; kh&oacute; khăn, thử th&aacute;ch trong cuộc sống, chỉ cần tự tin, tin v&agrave;o bản th&acirc;n m&igrave;nh v&agrave; cố gắng th&igrave; sẽ mang lại kết quả tốt đẹp. Lẵng hoa sen phối hợp c&ugrave;ng những lo&agrave;i hoa kh&aacute;c c&ugrave;ng t&ocirc;ng hồng trang nh&atilde; c&ograve;n c&oacute; thể l&', N'huongsen1.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (16, N'Sức Sống', N'', CAST(850000 AS Decimal(20, 0)), N'<p>Lẵng hoa ho&agrave;n to&agrave;n nỗi bật với sắc hồng đầy lung linh rạng ngời tạo n&ecirc;n từ những c&aacute;nh hồng d&acirc;u v&agrave; hồng da tươi đẹp v&agrave; đầy sức sống nhất. Với thiết kế mới lạ tỏa rộng xung quanh, lẵng hoa kh&ocirc;ng chỉ l&agrave; một m&oacute;n qu&agrave; đầy &yacute; nghĩa m&agrave; c&ograve;n l&agrave; vật trang tr&iacute; tinh tế mang lại cho nh&agrave;, văn ph&ograve;ng c&ocirc;ng ty một kh&ocirc;ng kh&iacute; đầy tươi mới.</p>
', N'sucsongkt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (17, N'Bình Minh', N'', CAST(900000 AS Decimal(20, 0)), N'<p>Sắc đỏ rực tượng trưng cho sự rực rỡ của mặt trời trong khi hồng kem đẹp như m&agrave;u của m&acirc;y v&agrave;o l&uacute;c b&igrave;nh minh. Giỏ hoa c&ugrave;ng những loại hoa kh&aacute;c nhau, thiết kế dựa theo vẻ đẹp của b&igrave;nh minh v&agrave; gửi gắm đi th&ocirc;ng điệp về một sự bắt đầu của những g&igrave; tươi mới v&agrave; tốt đẹp nhất.</p>
', N'binhminhkt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (18, N'Rạng Rỡ', N'', CAST(900000 AS Decimal(20, 0)), N'<p>Lẵng hoa rực rỡ n&agrave;y sẽ l&agrave; một sự lựa chọn th&iacute;ch hợp cho dịp khai trương sắp tới. Với t&ocirc;ng m&agrave;u rực rỡ chủ đạo với m&agrave;u v&agrave;ng của ly, lan, sắc đỏ thắm của hoa hồng đỏ v&agrave; sự nhẹ nh&agrave;ng của hồng pastel v&agrave; c&uacute;c xanh. Đ&acirc;y chắc chắn sẽ tạo một điểm nhấn cho cửa h&agrave;ng mới trong ng&agrave;y khai trương.</p>
', N'rangrokt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (19, N'Tấn Tới', N'', CAST(900000 AS Decimal(20, 0)), N'<p>Lẵng hoa đẹp như một kh&uacute;c ca chiến thắng đầy tự h&agrave;o v&agrave; vẻ vang. Lẵng hoa gồm sắc v&agrave;ng rực rỡ từ hoa lan, sắc hồng tươi s&aacute;ng của ly c&ugrave;ng sắc xanh tươi của c&uacute;c bing bong v&agrave; c&agrave;ng nổi bật hơn với nh&agrave;nh hồ điệp trắng thanh cao tượng trưng cho một lời ch&uacute;c tốt đẹp nhất cho ng&agrave;y trọng đại.</p>
', N'tantoikt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (20, N'Ước Mơ', N'', CAST(900000 AS Decimal(20, 0)), N'<p>Mỗi người đều lu&ocirc;n ấp ủ, hy vọng v&agrave; phấn đấu v&igrave; ước mơ, kh&aacute;t vọng của ri&ecirc;ng m&igrave;nh. Lẵng hoa với những b&ocirc;ng hoa hướng dương rực rỡ như m&agrave;u sắc tươi s&aacute;ng của mặt trời sẽ mang đến những điều may mắn, những niềm vui, trong khi hồng đỏ tượng trưng cho tinh thần mạnh mẽ, sự nhiệt huyết v&agrave; kh&ocirc;ng ngừng chiến đấu. Kết hợp c&ugrave;ng lan, hồng da v&agrave; c&aacute;c loại hoa đa sắc m&agrave;u kh&aacute;c, hộp hoa thay bạn gửi đi ', N'uocmokt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (21, N'Nổi Bật ', N'', CAST(950000 AS Decimal(20, 0)), N'<p>Hồng m&ocirc;n trắng tượng trưng cho một khởi đầu đầy tinh kh&ocirc;i v&agrave; may mắn, kết hợp c&ugrave;ng sắc đỏ của hoa hồng tượng trưng cho niềm tin v&agrave;o chiến thắng. Lẵng hoa th&iacute;ch hợp tặng trong c&aacute;c dịp sinh nhật, kỉ niệm hay ch&uacute;c mừng cho đối t&aacute;c hay doanh nghiệp bạn quan t&acirc;m đến. H&atilde;y c&ugrave;ng gửi đến họ lẵng hoa tươi đẹp c&ugrave;ng một lời ch&uacute;c th&agrave;nh c&ocirc;ng thật ch&acirc;n th&agrave;nh v&agrave; &yacute; nghĩa nh&ea', N'noibatkt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (22, N'Tấn Tài', N'', CAST(1500000 AS Decimal(20, 0)), N'<p>Thiết kế độc đ&aacute;o kh&aacute;c với c&aacute;c kệ hoa ch&uacute;c mừng kh&aacute;c, kệ hoa được tạo n&ecirc;n từ những b&ocirc;ng hoa hướng dương v&agrave;ng rực rỡ c&ugrave;ng calomero xanh mướt tượng trưng cho một lời ch&uacute;c mừng đầy h&acirc;n hoan, một lời gửi gắm niềm tin v&agrave;o tương lai đầy tốt đẹp v&agrave; rạng rỡ.</p>
', N'tantaikt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (23, N'Hy Vọng', N'', CAST(1300000 AS Decimal(20, 0)), N'<p>Lẵng hoa được thiết kế từ những c&aacute;nh hồng mang t&ocirc;ng m&agrave;u pastel nhẹ nh&agrave;ng, l&atilde;ng mạn v&agrave; đầy sự sang trọng, tinh tế. Hộp hoa l&agrave; m&oacute;n qu&agrave; tuyệt vời v&agrave; cực kỳ &yacute; nghĩa cho những người phụ nữ quan trọng nhất trong cuộc đời m&igrave;nh. Đ&acirc;y cũng l&agrave; một m&oacute;n qu&agrave; ch&uacute;c mừng đầy tinh tế m&agrave; bạn c&oacute; thể gửi tặng cho đồng nghiệp, bạn b&egrave; hay cấp tr&ecirc;n v&agrave;o những dịp như k', N'hyvongkt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 2)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (24, N'Vạng Danh', N'', CAST(1900000 AS Decimal(20, 0)), N'<p>Đẹp sang trọng v&agrave; đầy tinh tế, kệ hoa đặc biệt được tạo th&agrave;nh từ hồng v&agrave; lan c&ugrave;ng hướng dương nổi bật. Lu&ocirc;n vững bước tr&ecirc;n con đường m&igrave;nh đ&atilde; chọn v&agrave; hướng đến một tương lai tươi s&aacute;ng v&agrave; tốt đẹp đầy an khang v&agrave; thịnh vượng l&agrave; th&ocirc;ng điệp kệ hoa n&agrave;y mang đến.</p>
', N'vangdanhkt.jpg', N'HKT', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (25, N'Bên Nhau Trọn Đời', N'', CAST(800000 AS Decimal(20, 0)), N'<p>Như t&ecirc;n gọi của m&igrave;nh b&oacute; hoa với nhiều tone m&agrave;u nhẹ nh&agrave;ng trong trẻo như cuộc sống h&ocirc;n nh&acirc;n lu&ocirc;n b&igrave;nh y&ecirc;n v&agrave; hạnh ph&uacute;c b&ecirc;n nhau đi hết cuộc đời n&agrave;y.</p>
', N'bennhautrondoihc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (26, N'Ngọn Lửa Tình Yêu', N'', CAST(800000 AS Decimal(20, 0)), N'<p>B&oacute; hoa thiết kế với tone m&agrave;u đỏ rực sắc với điểm nhấn trắng tinh kh&ocirc;i d&agrave;nh cho c&ocirc; d&acirc;u th&iacute;ch hồng đỏ cũng như tone m&agrave;u đỏ - m&agrave;u của sự m&atilde;nh liệt như ngọn lửa y&ecirc;u thương b&ugrave;ng ch&agrave;y m&atilde;i m&atilde;i.</p>
', N'bennhautrondoihc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (27, N'Miền Cát Trắng', N'', CAST(600000 AS Decimal(20, 0)), N'<p>Xuy&ecirc;n suốt b&oacute; hoa l&agrave; tone m&agrave;u trắng l&agrave;m chủ đạo tạo sự &ecirc;m đềm v&agrave; s&acirc;u lắng như b&atilde;i c&aacute;t trắng mềm mại v&agrave; &ecirc;m &aacute;i tiếp th&ecirc;m niềm vui cho c&ocirc; d&acirc;u, ch&uacute; rể trong những bước đi đầu ti&ecirc;n trong đời sống h&ocirc;n nh&acirc;n.</p>
', N'miencattranghc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (28, N'Pha Lê Tím', N'', CAST(700000 AS Decimal(20, 0)), N'<p>Pha L&ecirc; T&iacute;m như c&aacute;i t&ecirc;n của m&igrave;nh b&oacute; hoa tựa như vi&ecirc;n pha l&ecirc; lấp l&aacute;nh, qu&yacute; gi&aacute; như cuộc sống h&ocirc;n nh&acirc;n phải lu&ocirc;n y&ecirc;u thương v&agrave; t&ocirc;n trọng nhau với t&igrave;nh y&ecirc;u vĩnh cửu - t&igrave;nh y&ecirc;u pha l&ecirc;.</p>
', N'phaletimhc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (29, N'Con Đường Màu Xanh', N'', CAST(1000000 AS Decimal(20, 0)), N'<p>B&oacute; hoa &quot;Con đường m&agrave;u xanh&quot; tone m&agrave;u xanh l&aacute; c&acirc;y chủ đạo th&iacute;ch hợp với c&ocirc; d&acirc;u th&iacute;ch tone m&agrave;u của thi&ecirc;n nhi&ecirc;n, sự thoải m&aacute;i v&agrave; tươi mới tr&ecirc;n bước đường mới</p>
', N'conduongmauxanhhc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (30, N'Giây Phút Êm Đềm', N'', CAST(800000 AS Decimal(20, 0)), N'<p>B&oacute; hoa đơn giản với hoa hồng trắng phối hợp c&ugrave;ng hoa baby tạo n&ecirc;n sức cuốn h&uacute;t đặc biệt. M&agrave;u trắng của sự tinh kh&ocirc;i như m&agrave;u v&aacute;y c&ocirc; d&acirc;u trong ng&agrave;y vui trọng đại của đời m&igrave;nh. B&oacute; hoa kho&aacute;c l&ecirc;n m&igrave;nh một vẻ đẹp sang trọng đến lạ l&ugrave;ng.</p>
', N'giayphutemdemhc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (31, N'Hạnh Phúc Lứa Đôi', N'', CAST(730000 AS Decimal(20, 0)), N'<p>Hoa hồng l&agrave; loại hoa thể hiện t&igrave;nh y&ecirc;u m&atilde;nh liệt, kết hợp với hoa baby trắng nhẹ nh&agrave;ng, c&ugrave;ng chiếc v&aacute;y cưới lộng lẫy, sẽ gi&uacute;p t&ocirc;n l&ecirc;n vẻ đẹp của c&ocirc; d&acirc;u trong ng&agrave;y cưới của m&igrave;nh.</p>
', N'hanhphucluadoihc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (32, N'Bên Nhau', N'', CAST(1600000 AS Decimal(20, 0)), N'<p>Ch&uacute;t nhẹ nh&agrave;ng của hồng pastel v&agrave; hồng v&agrave;ng kết hợp c&ugrave;ng sắc t&iacute;m, trắng d&agrave;nh cho c&aacute;c c&ocirc; n&agrave;ng ngọt ng&agrave;o, l&atilde;ng mạn, dễ thương trong ng&agrave;y trọng đại của cuộc đời khi s&aacute;nh đ&ocirc;i c&ugrave;ng người m&igrave;nh y&ecirc;u thương.</p>
', N'bennhautrondoihc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (33, N'Ngày Chung Đôi', N'', CAST(480000 AS Decimal(20, 0)), N'<p>Niềm hạnh ph&uacute;c của một c&ocirc; g&aacute;i đ&oacute; l&agrave; về chung một nh&agrave; với người m&igrave;nh y&ecirc;u thương, v&agrave; ng&agrave;y đặc biệt ấy sẽ c&agrave;ng trở n&ecirc;n &yacute; nghĩa hơn khi c&ocirc; d&acirc;u cầm trong tay b&oacute; hoa cưới t&ocirc;ng hồng phớt n&agrave;y, được l&agrave;m bởi những đ&oacute;a hồng trắng, tạo n&ecirc;n điểm nhấn đ&aacute;ng y&ecirc;u. Đ&acirc;y sẽ l&agrave; b&oacute; hoa gi&uacute;p c&ocirc; d&acirc;u c&agrave;ng nổi bật hơn tron', N'ngaychungdoihc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (34, N'Ngày Hạnh PHúc', N'', CAST(800000 AS Decimal(20, 0)), N'<p>Ngọt ng&agrave;o, l&atilde;ng mạn v&agrave; dễ thương, b&oacute; hoa cầm tay được dựa tr&ecirc;n cảm hứng từ những c&acirc;u chuyện t&igrave;nh trẻ trung, đ&aacute;ng y&ecirc;u v&agrave; đầy nhiệt huyết. T&ocirc;ng m&agrave;u pastel đ&aacute;ng y&ecirc;u sẽ g&oacute;p phần t&ocirc; th&ecirc;m m&agrave;u sắc hạnh ph&uacute;c v&agrave;o đ&aacute;m cưới của bạn đấy.</p>
', N'ngayhanhphuchc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (35, N'Ta Mai Bên Nhau', N'', CAST(700000 AS Decimal(20, 0)), N'<p>B&oacute; hoa với tone m&agrave;u dịu d&agrave;ng, ngọt ng&agrave;o th&ecirc;m gia vị cho cuộc sống h&ocirc;n nh&acirc;n lu&ocirc;n đẹp đẽ v&agrave; b&igrave;nh y&ecirc;n. Ph&ugrave; hợp với c&ocirc; d&acirc;u y&ecirc;u th&iacute;ch sự nhẹ nh&agrave;ng, dịu &ecirc;m như vi&ecirc;n kẹo ngọt</p>
', N'tamaibennhauhc.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (36, N'Vì Sao Trong Tôi', N'', CAST(100000 AS Decimal(20, 0)), N'<p>B&oacute; hoa V&igrave; sao trong t&ocirc;i thiết kế hiện đại nhưng đơn giản tạo cảm gi&aacute;c thanh tho&aacute;t v&agrave; gần gũi d&agrave;nh cho những c&ocirc; d&acirc;u th&iacute;ch sự th&acirc;n quen, thời thượng nhưng vẫn c&oacute; ho&agrave;i cổ như sự thăng trầm trong t&igrave;nh y&ecirc;u.</p>
', N'visaotrongtoi.jpg', N'HC', CAST(0xA9A90000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (37, N'Giấc Mơ Tình Yêu', N'Đà Lạt', CAST(600000 AS Decimal(20, 0)), N'<p>Anh kh&ocirc;ng l&agrave; nh&agrave; thơ. Cũng kh&ocirc;ng l&agrave; thi sĩ. Bởi buổi chiều chỉ nhớ. Một h&igrave;nh b&oacute;ng y&ecirc;u thương. Giấc mơ của anh l&agrave; được b&ecirc;n em. T&igrave;nh y&ecirc;u của anh v&agrave; em tỏa s&aacute;ng hơn cả bầu trời chiều t&iacute;m soi rọi cho giấc mơ của hai ta.</p>', N'giacmotinhyeusn.jpg', N'HSN', CAST(0xA9B20000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (38, N'Diều Giản Dị', N'', CAST(800000 AS Decimal(20, 0)), N'<p>Giỏ hoa được cắm tr&ograve;n 2 mặt với thiết kế chủ đạo l&agrave; hoa hồng sen m&agrave;u hồng phấn nhẹ nh&agrave;ng v&agrave; tao nh&atilde;, c&ugrave;ng cẩm chướng hồng phối hợp xen kẽ nhau tạo n&ecirc;n một sản phẩm hoa thu h&uacute;t ngay từ &aacute;nh nh&igrave;n đầu ti&ecirc;n. Tuy giản dị, mộc mạc nhưng chắc chắn sẽ l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa tuyệt vời d&agrave;nh tặng cho những người th&acirc;n y&ecirc;u của m&igrave;nh.</p>', N'dieugiandisn.jpg', N'HSN', CAST(0xA9B20000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (39, N'Dịu Dàng', N'', CAST(700000 AS Decimal(20, 0)), N'<p>Với tone m&agrave;u hồng pastel nhẹ nh&agrave;ng v&agrave; tr&agrave;n đầy nữ t&iacute;nh như sự dịu d&agrave;ng, đằm thắm của những c&ocirc; thiếu nữ xinh xắn tuổi trăng tr&ograve;n. Hoa hồng da kết hợp c&ugrave;ng c&aacute;t tường hồng v&agrave; baby trắng chắc chắn sẽ l&agrave; điều bất ngờ v&agrave; sang trọng d&agrave;nh tặng cho những c&ocirc; g&aacute;i đ&aacute;ng y&ecirc;u.</p>
', N'diudangsn.jpg', N'HSN', CAST(0xA9B20000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (40, N'Hạnh Phúc Muôn Màu', N'', CAST(700000 AS Decimal(20, 0)), N'<p>Hạnh ph&uacute;c l&agrave; cảm gi&aacute;c m&agrave; ai cũng mong muốn c&oacute; được. Đ&ocirc;i khi thật nhẹ nh&agrave;ng cũng c&oacute; khi l&agrave; sự nồng nhiệt đến ch&aacute;y bỏng trong từng h&agrave;nh động quan t&acirc;m giữa những người th&acirc;n y&ecirc;u với nhau. Như m&agrave;u sắc của b&oacute; hoa được kết hợp nhiều loại hoa tạo n&ecirc;n sắc m&agrave;u của sự hạnh ph&uacute;c</p>
', N'hanhphucmuonmausn.jpg', N'HSN', CAST(0xA9B20000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (41, N'Khoe Sắc Thắm', N'', CAST(800000 AS Decimal(20, 0)), N'<p>T&ocirc;i nhớ một ng&agrave;y xa x&ocirc;i chớm thu. Em đến thăm t&ocirc;i một chiều khi nắng t&agrave;n. Cỏ hoa dường như khoe sắc thắm. Nghi&ecirc;ng nghi&ecirc;ng đ&oacute;n g&oacute;t người đi. Y&ecirc;u đương d&acirc;ng s&oacute;ng t&igrave;nh mến. T&ocirc;i nhớ một chiều đơn c&ocirc;i chớm thu em đến. Với sự kết hợp nhiều loại hoa c&ugrave;ng với tone m&agrave;u pastel nhẹ nh&agrave;ng thật trẻ trung v&agrave; năng động.</p>
', N'khoesacthamsn.jpg', N'HSN', CAST(0xA9B20000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (42, N'Hạnh Phúc', N'', CAST(700000 AS Decimal(20, 0)), N'<p>Hạnh ph&uacute;c l&agrave; c&aacute;i g&igrave;? Đ&oacute; l&agrave; cảm gi&aacute;c đến từ tr&aacute;i tim, chứ kh&ocirc;ng phải nhận định của người kh&aacute;c. Hạnh ph&uacute;c v&agrave; bi ai thực sự, chỉ c&oacute; bản th&acirc;n mới hiểu, định nghĩa của hạnh ph&uacute;c của mỗi người đ&acirc;u c&oacute; giống nhau. Hạnh ph&uacute;c l&agrave; hai người y&ecirc;n lặng bảo vệ, gom g&oacute;p tất cả t&igrave;nh y&ecirc;u gửi s&acirc;u v&agrave;o đ&aacute;y l&ograve;ng, ng&agrave;y qua ng&agr', N'hanhphucsn.jpg', N'HSN', CAST(0xA9B20000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (43, N'Tình Hồng', N'', CAST(800000 AS Decimal(20, 0)), N'<p>Với sự kết hợp của m&agrave;u hồng ngọt ng&agrave;o v&agrave; m&agrave;u t&iacute;m của sự l&atilde;ng mạng, b&oacute; hoa sẽ l&agrave; m&oacute;n qu&agrave; tinh thần đầy &yacute; nghĩa d&agrave;nh cho cho c&aacute;c c&ocirc; n&agrave;ng y&ecirc;u th&iacute;ch sự nhẹ nh&agrave;ng, tinh tế v&agrave; th&ugrave;y mị. Mẫu hoa th&iacute;ch hợp tặng v&agrave;o những dịp lễ kỷ niệm, sinh nhật hoặc đơn giản v&agrave;o những buổi hẹn h&ograve; cuối tuần.</p>
', N'tinhhongsn.jpg', N'HSN', CAST(0xA9B20000 AS SmallDateTime), 100, 0)
INSERT [dbo].[HOA] ([MAHOA], [TENHOA], [XUATSU], [DONGIA], [MOTA], [ANHHOA], [MADMH], [NGAYCAPNHAT], [TONGSOLUONG], [SOLANXEM]) VALUES (44, N'Tặng Bạn', N'Đà Lạt', CAST(700000 AS Decimal(20, 0)), N'<p>Một ng&agrave;n lời ca ngọt ng&agrave;o cũng kh&ocirc;ng bằng một lời n&oacute;i ch&acirc;n th&agrave;nh xuất ph&aacute;t từ tận tr&aacute;i tim v&agrave; đ&ocirc;i khi chỉ cần những h&agrave;nh động quan t&acirc;m đ&uacute;ng l&uacute;c v&agrave; một b&oacute; hoa v&agrave;o những ng&agrave;y đặc biệt hoặc g&acirc;y bất ngờ v&agrave;o những dịp cuối tuần cũng c&oacute; thể n&oacute;i l&ecirc;n trọn tấm ch&acirc;n t&igrave;nh của bạn. B&oacute; hoa được thiết kế cầu kỳ với nhiều m&agrave;u sắ', N'tangbansn.jpg', N'HSN', CAST(0xA9B20000 AS SmallDateTime), 100, 0)
SET IDENTITY_INSERT [dbo].[HOA] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MAKH], [TENKH], [DIACHI], [NGAYSINH], [GIOITINH], [EMAIL], [TENDN], [MATKHAU]) VALUES (1, N'Nguyễn Chí Cường', N'Phú Lợi 1', CAST(0x8C230000 AS SmallDateTime), 0, N'nguyenchicuong31998@gmail.com', N'nguyenchicuong', N'12')
INSERT [dbo].[KHACHHANG] ([MAKH], [TENKH], [DIACHI], [NGAYSINH], [GIOITINH], [EMAIL], [TENDN], [MATKHAU]) VALUES (2, N'Nguyễn Chí Tâm', N'Phú lợi', CAST(0x8F5B0000 AS SmallDateTime), 0, N'nguyenchitam@gmail.com', N'nguyenchitam', N'12')
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[QUANGCAO] ON 

INSERT [dbo].[QUANGCAO] ([IDQC], [TENQC], [ANH], [HREF], [NGAYBATDAU], [NGAYKETTHUC], [THUTUQC], [TRANGTHAI]) VALUES (1, N'Logo', N'logo.png', N'', CAST(0xA9A90000 AS SmallDateTime), CAST(0xA9C10000 AS SmallDateTime), 1, 1)
INSERT [dbo].[QUANGCAO] ([IDQC], [TENQC], [ANH], [HREF], [NGAYBATDAU], [NGAYKETTHUC], [THUTUQC], [TRANGTHAI]) VALUES (2, N'Banner', N'hoa.jpg', N'', CAST(0xA9A90000 AS SmallDateTime), CAST(0xA9BF0000 AS SmallDateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[QUANGCAO] OFF
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [NOIDUNG], [NGAYDANG], [LUOTXEM]) VALUES (1, 1, N'TẶNG THẺ KHÁCH HÀNG', N'Nội dung tặng thẻ ', CAST(0xA9A90000 AS SmallDateTime), 0)
INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [NOIDUNG], [NGAYDANG], [LUOTXEM]) VALUES (2, 1, N'ĐIỀU CHỈNH GIÁ BÁN LẺ', N'Nội dung điều chỉnh giá bán lẻ', CAST(0xA9A90000 AS SmallDateTime), 0)
INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [NOIDUNG], [NGAYDANG], [LUOTXEM]) VALUES (3, 1, N'THÔNG BÁO NGHỈ LỄ NOEL', N'Nội dung nghỉ lễ ', CAST(0xA9A90000 AS SmallDateTime), 0)
INSERT [dbo].[TINTUC] ([MATT], [MAAD], [TIEUDE], [NOIDUNG], [NGAYDANG], [LUOTXEM]) VALUES (4, 2, N'THÔNG BÁO RA MẮT SẢN PHẨM MỚI', N'Nội dung ra mắt', CAST(0xA9B20000 AS SmallDateTime), 0)
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
SET IDENTITY_INSERT [dbo].[YNGHIAHOA] ON 

INSERT [dbo].[YNGHIAHOA] ([IDYN], [TIEUDE], [ANH], [MOTA], [NOIDUNG], [NGAYDANG]) VALUES (1, N'Loài hoa là biểu tượng của núi rừng và ý nghĩa của loài hoa lan', N'hoalan.jpg', N'Loài hoa là biểu tượng của núi rừng và ý nghĩa của loài hoa lan. Hãy cùng chúng tôi tìm hiểu về ý nghĩa của các loài hoa lan nhé!', NULL, CAST(0xA9A90000 AS SmallDateTime))
INSERT [dbo].[YNGHIAHOA] ([IDYN], [TIEUDE], [ANH], [MOTA], [NOIDUNG], [NGAYDANG]) VALUES (2, N'Biểu tượng của sự chia ly, ý nghĩa của hoa tigon', N'tigon.jpg', N'Biểu tượng của sự chia ly, ý nghĩa của hoa tigon. Hãy cùng chúng tôi tìm hiểu về ý nghĩa của các loài hoa lan nhé!', NULL, CAST(0xA9A90000 AS SmallDateTime))
INSERT [dbo].[YNGHIAHOA] ([IDYN], [TIEUDE], [ANH], [MOTA], [NOIDUNG], [NGAYDANG]) VALUES (3, N'Hoa là sự biết ơn và ý nghĩa của hoa cẩm tú cầu', N'camtucau.jpg', N'Hoa cẩm tú cầu đẹp, nhiều mẫu hoa cẩm tú cầu, ý nghĩa của hoa cẩm tú cầu.  Hãy cùng chúng tôi tìm hiểu về ý nghĩa của các loài hoa lan nhé!', NULL, CAST(0xA9A90000 AS SmallDateTime))
INSERT [dbo].[YNGHIAHOA] ([IDYN], [TIEUDE], [ANH], [MOTA], [NOIDUNG], [NGAYDANG]) VALUES (4, N'Ý nghĩa của hoa mười giờ, hoa tượng trưng cho tình yêu của tuổi học trò', N'hoamuoigio.jpg', N'Ý nghĩa của hoa mười giờ,hoa tượng trưng cho tình yêu của tuổi học trò.  Hãy cùng chúng tôi tìm hiểu về ý nghĩa của các loài hoa lan nhé!', NULL, CAST(0xA9A90000 AS SmallDateTime))
INSERT [dbo].[YNGHIAHOA] ([IDYN], [TIEUDE], [ANH], [MOTA], [NOIDUNG], [NGAYDANG]) VALUES (5, N'Ý nghĩa của loài hoa cúc và công dụng đặc biệt của hoa cúc', N'hoacuc.jpg', N'Ý nghĩa của loài hoa cúc và công dụng đặc biệt của hoa cúc. Hãy cùng chúng tôi tìm hiểu về ý nghĩa của các loài hoa lan nhé!', NULL, CAST(0xA9A90000 AS SmallDateTime))
INSERT [dbo].[YNGHIAHOA] ([IDYN], [TIEUDE], [ANH], [MOTA], [NOIDUNG], [NGAYDANG]) VALUES (6, N'Loài hoa nhỏ và ý nghĩa của cúc họa mi', N'cuchoami.jpg', N'Hoa cúc họa mi nhỏ đẹp, ý nghĩa của của loài hoa cúc hoa mi.  Hãy cùng chúng tôi tìm hiểu về ý nghĩa của các loài hoa lan nhé!', NULL, CAST(0xA9A90000 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[YNGHIAHOA] OFF
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MAKH])
GO
ALTER TABLE [dbo].[CTDATHANG]  WITH CHECK ADD FOREIGN KEY([MADH])
REFERENCES [dbo].[DONDATHANG] ([MADH])
GO
ALTER TABLE [dbo].[CTDATHANG]  WITH CHECK ADD FOREIGN KEY([MAHOA])
REFERENCES [dbo].[HOA] ([MAHOA])
GO
ALTER TABLE [dbo].[DANHMUCCON]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[DANHMUCHOA] ([ID])
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MAKH])
GO
ALTER TABLE [dbo].[HOA]  WITH CHECK ADD FOREIGN KEY([MADMH])
REFERENCES [dbo].[DANHMUCCON] ([MADMH])
GO
ALTER TABLE [dbo].[TINTUC]  WITH CHECK ADD  CONSTRAINT [FK__TINTUC__MAAD__5165187F] FOREIGN KEY([MAAD])
REFERENCES [dbo].[ADMIN] ([MAAD])
GO
ALTER TABLE [dbo].[TINTUC] CHECK CONSTRAINT [FK__TINTUC__MAAD__5165187F]
GO
USE [master]
GO
ALTER DATABASE [QLBANHOA] SET  READ_WRITE 
GO
