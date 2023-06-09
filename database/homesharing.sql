USE [master]
GO
/****** Object:  Database [HomeSharing1]    Script Date: 3/25/2023 8:46:44 PM ******/
CREATE DATABASE [HomeSharing1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeSharing1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\HomeSharing1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HomeSharing1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\HomeSharing1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HomeSharing1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeSharing1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeSharing1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeSharing1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeSharing1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeSharing1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeSharing1] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeSharing1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HomeSharing1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeSharing1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeSharing1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeSharing1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeSharing1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeSharing1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeSharing1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeSharing1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeSharing1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomeSharing1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeSharing1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeSharing1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeSharing1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeSharing1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeSharing1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeSharing1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeSharing1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HomeSharing1] SET  MULTI_USER 
GO
ALTER DATABASE [HomeSharing1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeSharing1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeSharing1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeSharing1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HomeSharing1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HomeSharing1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeSharing1', N'ON'
GO
ALTER DATABASE [HomeSharing1] SET QUERY_STORE = OFF
GO
USE [HomeSharing1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](60) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[create_date] [date] NOT NULL,
	[expired_date] [date] NULL,
	[status] [int] NOT NULL,
	[role] [int] NOT NULL,
	[room_id] [int] NULL,
	[post_id] [int] NULL,
 CONSTRAINT [PK__Accounts__46A222CDE6C70A81] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountInformation]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountInformation](
	[accountinfo_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[dob] [date] NULL,
	[sex] [bit] NULL,
	[phone] [varchar](11) NULL,
	[address] [nvarchar](255) NULL,
	[identity_card_number] [varchar](12) NULL,
 CONSTRAINT [PK__AccountI__2725CC88D4A18ED9] PRIMARY KEY CLUSTERED 
(
	[accountinfo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[total_money] [decimal](18, 0) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[bill_title] [varchar](50) NULL,
	[expired_payment_date] [datetime] NOT NULL,
	[payment_date] [datetime] NULL,
	[status] [bit] NOT NULL,
	[payment_id] [int] NULL,
	[room_id] [int] NOT NULL,
 CONSTRAINT [PK__Bill__D706DDB37247E613] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[billdetail_id] [int] IDENTITY(1,1) NOT NULL,
	[consumeIDStart] [int] NOT NULL,
	[consumeIDEnd] [int] NOT NULL,
	[housemanager_id] [int] NOT NULL,
	[tenant_id] [int] NULL,
	[bill_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[billdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillService]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillService](
	[billdetail_id] [int] NOT NULL,
	[houseservice_id] [int] NOT NULL,
 CONSTRAINT [PK_BillService] PRIMARY KEY CLUSTERED 
(
	[houseservice_id] ASC,
	[billdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consume]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consume](
	[consume_id] [int] IDENTITY(1,1) NOT NULL,
	[number_electric] [int] NOT NULL,
	[number_water] [int] NOT NULL,
	[update_date] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[room_id] [int] NOT NULL,
 CONSTRAINT [PK__Consumes__B28BF50FF767A7C4] PRIMARY KEY CLUSTERED 
(
	[consume_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[contract_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[deposit] [decimal](18, 0) NOT NULL,
	[housemanager_id] [int] NOT NULL,
	[tenant_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK__Contract__F8D66423CFA9A95D] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[house_id] [int] IDENTITY(1,1) NOT NULL,
	[housemanager_id] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[price] [money] NOT NULL,
	[describe] [nvarchar](max) NOT NULL,
	[city] [nvarchar](255) NOT NULL,
	[img] [nvarchar](max) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK__House__E246264151080C47] PRIMARY KEY CLUSTERED 
(
	[house_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseService]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseService](
	[houseservice_id] [int] IDENTITY(1,1) NOT NULL,
	[house_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[service_price] [decimal](18, 0) NOT NULL,
	[valid_date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_HostelService_1] PRIMARY KEY CLUSTERED 
(
	[houseservice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notification_id] [int] IDENTITY(1,1) NOT NULL,
	[housemanager_id] [int] NOT NULL,
	[house_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK__Notifica__E059842F98ABF20D] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Payment__ED1FC9EACDC126B0] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_title] [nvarchar](255) NOT NULL,
	[post_text] [nvarchar](max) NOT NULL,
	[account_id] [int] NOT NULL,
	[create_date] [date] NOT NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](20) NULL,
	[price] [nvarchar](50) NULL,
	[img] [nvarchar](max) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] NOT NULL,
	[house_id] [int] NOT NULL,
	[room_number] [int] NOT NULL,
	[cus_name] [nvarchar](50) NULL,
	[cus_email] [nvarchar](50) NULL,
	[cus_phone] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Room1] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 3/25/2023 8:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](255) NOT NULL,
	[unit] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Services__3E0DB8AFD45255D2] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (1, N'admin', N'admin', CAST(N'2001-01-01' AS Date), NULL, 1, 1, NULL, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (2, N'manager1', N'manager1', CAST(N'2001-01-01' AS Date), NULL, 1, 2, NULL, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (3, N'manager2', N'manager2', CAST(N'2001-01-01' AS Date), NULL, 1, 2, NULL, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (4, N'renter1', N'renter1', CAST(N'2022-05-01' AS Date), CAST(N'2023-05-01' AS Date), 1, 3, 1, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (5, N'renter2', N'renter2', CAST(N'2022-08-08' AS Date), NULL, 1, 3, 0, 0)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (6, N'user6', N'user6', CAST(N'2022-08-08' AS Date), NULL, 0, 3, 0, 0)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (7, N'user7', N'user7', CAST(N'2022-08-08' AS Date), NULL, 0, 3, 0, 0)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (8, N'user8', N'user8', CAST(N'2022-07-15' AS Date), NULL, 1, 3, 2, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (9, N'user9', N'user9', CAST(N'2022-07-15' AS Date), NULL, 1, 3, 2, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (10, N'user10', N'user10', CAST(N'2022-07-19' AS Date), NULL, 0, 3, NULL, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (11, N'user11', N'user11', CAST(N'2022-07-19' AS Date), NULL, 1, 3, NULL, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (12, N'user12', N'user12', CAST(N'2022-07-19' AS Date), NULL, 1, 3, NULL, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (13, N'user13', N'user13', CAST(N'2022-07-19' AS Date), NULL, 1, 3, NULL, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (14, N'user14', N'user14', CAST(N'2022-07-19' AS Date), NULL, 1, 3, NULL, NULL)
INSERT [dbo].[Account] ([account_id], [username], [password], [create_date], [expired_date], [status], [role], [room_id], [post_id]) VALUES (15, N'user15', N'user15', CAST(N'2022-07-19' AS Date), NULL, 0, 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountInformation] ON 

INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (1, 1, N'Đỗ Duy Mạnh1', N'ddmanh17602@gmail.com', CAST(N'2002-06-18' AS Date), 1, N'0334678930', N'Hà Nội', N'12345678901')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (2, 2, N'Ngô Thành Long', N'longnthe163100@fpt.edu.vn', CAST(N'2002-06-17' AS Date), 1, N'0866956913', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (3, 3, N'Nguyễn Tiến Nam', N'duymanh1762002@gmail.com', CAST(N'1995-01-05' AS Date), 1, N'0922532627', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (4, 4, N'Trần Huyền', N'testmail7622@gmail.com', CAST(N'1995-01-05' AS Date), 0, N'0792444333', N'Hà Nội1', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (5, 5, N'Trần Nam Tiến', N'testmail7623@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0987654321', N'Bắc Giang', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (6, 6, N'Nguyễn Văn Bình', N'testmail7624@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (7, 7, N'Nguyễn Tiến', N'testmail7625@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (8, 8, N'Nam Thành', N'testmail7626@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (9, 9, N'Nguyễn Thanh Bình', N'testmail7627@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (10, 10, N'Cấn Duy Khánh', N'testmail7628@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (11, 11, N'Nguyễn Văn G', N'testmail7629@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (12, 12, N'Nguyễn Văn G', N'testmail7630@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (13, 13, N'Nguyễn Văn G', N'testmail7631@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (14, 14, N'Nguyễn Văn G', N'testmail7632@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
INSERT [dbo].[AccountInformation] ([accountinfo_id], [account_id], [fullname], [email], [dob], [sex], [phone], [address], [identity_card_number]) VALUES (15, 15, N'151', N'testmail7633@gmail.com', CAST(N'2002-06-17' AS Date), 0, N'0334678931', N'Hà Nội', N'123456789')
SET IDENTITY_INSERT [dbo].[AccountInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (1, CAST(3955000 AS Decimal(18, 0)), CAST(N'2022-01-29T20:09:13.737' AS DateTime), N'1/2022', CAST(N'2022-02-05T00:00:00.000' AS DateTime), CAST(N'2022-01-31T23:05:52.003' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (2, CAST(4225000 AS Decimal(18, 0)), CAST(N'2022-02-28T20:16:02.760' AS DateTime), N'2/2022', CAST(N'2022-03-02T00:00:00.000' AS DateTime), CAST(N'2022-03-01T20:31:55.330' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (3, CAST(3800000 AS Decimal(18, 0)), CAST(N'2022-03-27T20:38:44.827' AS DateTime), N'3/2022', CAST(N'2022-04-01T00:00:00.000' AS DateTime), CAST(N'2022-04-01T15:07:26.513' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (4, CAST(3800000 AS Decimal(18, 0)), CAST(N'2022-04-29T07:44:16.527' AS DateTime), N'4/2022', CAST(N'2022-05-02T00:00:00.000' AS DateTime), CAST(N'2022-05-01T21:23:18.010' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (5, CAST(4925000 AS Decimal(18, 0)), CAST(N'2022-05-28T21:26:56.917' AS DateTime), N'5/2022', CAST(N'2022-06-02T00:00:00.000' AS DateTime), CAST(N'2022-06-01T21:27:29.390' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (6, CAST(3800000 AS Decimal(18, 0)), CAST(N'2022-06-28T16:21:58.963' AS DateTime), N'6/2022', CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-01T22:36:46.123' AS DateTime), 1, 1, 1)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (7, CAST(3357000 AS Decimal(18, 0)), CAST(N'2022-02-28T22:23:47.300' AS DateTime), N'2/2022', CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-01T22:36:55.330' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (8, CAST(3046000 AS Decimal(18, 0)), CAST(N'2022-03-30T22:25:39.547' AS DateTime), N'3/2022', CAST(N'2022-04-02T00:00:00.000' AS DateTime), CAST(N'2022-04-01T22:37:13.653' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (9, CAST(3060000 AS Decimal(18, 0)), CAST(N'2022-04-29T22:26:54.827' AS DateTime), N'4/2022', CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-05-01T22:43:06.130' AS DateTime), 1, 1, 2)
INSERT [dbo].[Bill] ([bill_id], [total_money], [created_date], [bill_title], [expired_payment_date], [payment_date], [status], [payment_id], [room_id]) VALUES (10, CAST(3150000 AS Decimal(18, 0)), CAST(N'2022-05-28T22:27:33.943' AS DateTime), N'5/2022', CAST(N'2022-06-02T00:00:00.000' AS DateTime), CAST(N'2022-06-01T22:43:15.170' AS DateTime), 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (1, 1, 11, 3, 4, 1)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (2, 2, 12, 3, 4, 2)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (3, 3, 13, 3, 4, 3)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (4, 4, 14, 3, 4, 4)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (5, 5, 15, 3, 4, 5)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (6, 6, 16, 3, 4, 6)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (7, 7, 17, 3, 4, 7)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (8, 8, 18, 3, 4, 8)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (9, 9, 19, 3, 4, 9)
INSERT [dbo].[BillDetail] ([billdetail_id], [consumeIDStart], [consumeIDEnd], [housemanager_id], [tenant_id], [bill_id]) VALUES (10, 10, 20, 3, 4, 10)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
GO
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (1, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (2, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (3, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (4, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (5, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (6, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (7, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (8, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (9, 6)
INSERT [dbo].[BillService] ([billdetail_id], [houseservice_id]) VALUES (10, 6)
GO
SET IDENTITY_INSERT [dbo].[Consume] ON 

INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (1, 0, 0, CAST(N'2022-06-14T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (2, 20, 20, CAST(N'2022-06-17T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (3, 50, 25, CAST(N'2022-06-20T14:13:53.857' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (4, 50, 25, CAST(N'2022-06-20T20:09:13.750' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (5, 100, 50, CAST(N'2022-06-20T20:10:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (6, 100, 50, CAST(N'2022-06-20T20:16:02.763' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (7, 100, 50, CAST(N'2022-06-20T20:38:44.847' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (8, 100, 50, CAST(N'2022-06-21T07:44:16.550' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (9, 300, 70, CAST(N'2022-06-22T21:25:38.257' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (10, 350, 75, CAST(N'2022-06-22T21:25:44.867' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (11, 350, 75, CAST(N'2022-06-22T21:26:56.950' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (12, 0, 0, CAST(N'2022-06-14T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (13, 20, 20, CAST(N'2022-06-17T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (14, 0, 0, CAST(N'2022-06-14T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (15, 50, 25, CAST(N'2022-06-20T20:09:13.750' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (16, 100, 50, CAST(N'2022-06-20T20:10:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (17, 20, 20, CAST(N'2022-06-17T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (18, 100, 50, CAST(N'2022-06-20T20:38:44.847' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (19, 100, 50, CAST(N'2022-06-21T07:44:16.550' AS DateTime), 1, 1)
INSERT [dbo].[Consume] ([consume_id], [number_electric], [number_water], [update_date], [status], [room_id]) VALUES (20, 300, 70, CAST(N'2022-06-22T21:25:38.257' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Consume] OFF
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (1, 1, CAST(3500000 AS Decimal(18, 0)), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), CAST(3500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (2, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 0)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (3, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 0)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (4, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 0)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (5, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2023-02-21T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (6, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 0)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (7, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2023-02-08T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (8, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (9, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (14, 1, CAST(3500000 AS Decimal(18, 0)), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), CAST(3500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (15, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 0)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (16, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 0)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (17, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 0)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (18, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2023-02-21T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (19, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 0)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (20, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2023-02-08T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (21, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 1)
INSERT [dbo].[Contract] ([contract_id], [room_id], [price], [start_date], [end_date], [deposit], [housemanager_id], [tenant_id], [status]) VALUES (22, 2, CAST(2500000 AS Decimal(18, 0)), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(2500000 AS Decimal(18, 0)), 3, 4, 1)
SET IDENTITY_INSERT [dbo].[Contract] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (1, 1, N'Đại Kim, Hoàng Mai, Hà Nội', 1500000.0000, N'zxvxbnbcxbcvbcvbcb', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (2, 2, N'110 Đ. Cầu Giấy, Quan Hoa, Cầu Giấy, Hà Nội', 1600000.0000, N'cxvcxvcv                  cvbcvbcv', N'Hà Nội', N'assets/img/imgproduct/dd6cbe04-a633-45bb-a307-dfbebb23c835_product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (3, 3, N'La Sơn, Bình Lục, Hà Nam', 1200000.0000, N'zx,cnzczxcnzxcnzxmczmxcmnxc', N'Hà Nam', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (4, 4, N'Duy Tiên, Bình Lục, Hà Nam', 1100000.0000, N'zxczxc', N'Hà Nam', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (5, 5, N'Nam Từ Liêm, Từ Liêm, Hà Nội', 1600000.0000, N'zxczxc', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (6, 6, N'Nam Từ Liêm, Từ Liêm, Hà Nội', 1100000.0000, N'zxczxc', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (7, 7, N'Nam Từ Liêm, Từ Liêm, Hà Nội', 1800000.0000, N'zxczxc', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (8, 8, N'Nam Từ Liêm, Từ Liêm, Hà Nội', 1900000.0000, N'zxczxc', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (9, 9, N'Nam Từ Liêm, Từ Liêm, Hà Nội', 2000000.0000, N'zxczxc', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (10, 10, N'Duy Tiên, Bình Lục, Hà Nam', 2100000.0000, N'zxczxc', N'Hà Nam', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (26, 1, N'Duy Tiên, Bình Lục, Hà Nam', 2200000.0000, N'zxczxc', N'Hà Nam', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (27, 2, N'Duy Tiên, Bình Lục, Hà Nam', 2300000.0000, N'bbbbbbbbbbbbb', N'Hà Nam', N'assets/img/imgproduct/product.jpg', 0)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (28, 3, N'Đại Kim, Hoàng Mai, Hà Nội', 2400000.0000, N'zxczxc', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (29, 4, N'Đại Kim, Hoàng Mai, Hà Nội', 1100000.0000, N'zxczxc', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (30, 5, N'Đại Kim, Hoàng Mai, Hà Nội', 1200000.0000, N'zxczxc', N'Hà Nội', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (31, 6, N'Sơn La', 1200000.0000, N'zxczxc', N'Sơn La', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (32, 7, N'Điện Biên Phủ, Sơn La', 1200000.0000, N'zxczxc', N'Sơn La', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (33, 8, N'12345 Nha Tran', 1200000.0000, N'zxczxc', N'Nha Trang', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (34, 9, N'12345 Đà Nẵng', 1200000.0000, N'zxczxc', N'Đà Nẵng', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (35, 10, N'Phủ Lý, Hà Nam', 1200000.0000, N'zxczxc', N'Hà Nam', N'assets/img/imgproduct/product.jpg', 1)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (41, 2, N'Tiêu Động, Bình Lục, Hà Nam', 1200000.0000, N'cvxcvxvxc', N'Hà Nam', N'assets/img/imgproduct/17e4aa1c-860c-4367-a421-dba5a11add9e_126898576_984339842089744_4932172973883319103_n.jpg', 0)
INSERT [dbo].[House] ([house_id], [housemanager_id], [address], [price], [describe], [city], [img], [status]) VALUES (42, 2, N'Tập Mỹ, Bình Lục, Hà Nam', 1200000.0000, N'knnkcnjc', N'Hà Nam', N'assets/img/imgproduct/9057d527-0f4b-4803-a0ee-5797cbf87681_240468793_107377395003472_6970621358980226155_n.jpg', 1)
SET IDENTITY_INSERT [dbo].[House] OFF
GO
SET IDENTITY_INSERT [dbo].[HouseService] ON 

INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (1, 1, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (2, 1, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (3, 1, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (4, 1, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (5, 1, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (6, 1, 1, CAST(3500 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (7, 1, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (8, 1, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (9, 1, 4, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HouseService] ([houseservice_id], [house_id], [service_id], [service_price], [valid_date], [status]) VALUES (10, 1, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[HouseService] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (1, 3, 1, N'Thông báo cúp điện', N'Theo thông tin từ công ty điện lực thì cuối tuần này vào thứ 7 sẽ cúp điện từ 7h sáng đến 17h chiều! Mọi người trong khu trọ chú ý để tránh ảnh hưởng đến sinh hoạt cũng như công việc.', CAST(N'2022-01-05T09:04:16.390' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (2, 3, 1, N'Tăng giá điện', N'Kể từ tháng sau, tức là tháng 3/2022 sẽ tăng giá điện của toàn bộ khu trọ từ 3000 vnd/kwh lên 3500kwh theo thông báo của công ty điện lực! Anh chị em sống trong khu trọ lưu ý nhé!', CAST(N'2022-02-12T17:29:58.363' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (3, 3, 1, N'Tăng giá nước ', N'Kể từ tháng sau, tức là tháng 5/2022 tăng giá nước từ 14000 vnd/m3 lên 16000 vnd/m3 theo giá mới của công ty nước! Mọi người trong khu trọ lưu ý để nắm bắt thông tin.', CAST(N'2022-04-12T17:31:58.550' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (4, 3, 1, N'Thông báo cúp điện ', N'Theo thông tin từ công ty điện lực thì cuối tuần này vào thứ 7 sẽ cúp điện từ 7h sáng đến 17h chiều! Mọi người trong khu trọ chú ý để tránh ảnh hưởng đến sinh hoạt cũng như công việc.', CAST(N'2022-04-22T17:33:28.717' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (6, 3, 1, N'Thông báo cúp nước/nước yếu', N'Theo thông tin nhận được thì công ty nước cần nâng cấp và bảo trì đường ống dẫn nước để bảo đảm lưu lượng cũng như nguồn nước đến người dân nên sẽ cúp nước vào các khung giờ từ 8h đến 11h và từ 13h đến 17h, từ 23h đêm đến 5h sáng các ngày từ ngày 14/06/2022 đến 18/06/2022. Mọi người chú ý có giải pháp dự trữ nước để tránh ảnh hưởng đến vệ sinh, sinh hoạt.', CAST(N'2022-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (7, 3, 1, N'Thông báo tu sửa phòng', N'Hiện tại tôi nhận được báo cáo có hiện tượng dột từ một số phòng nên sáng thứ 5 tuần này sẽ có đội ngũ thợ đến kiểm tra và khắc phục sự cố. Mọi người chú ý.', CAST(N'2022-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (9, 3, 1, N'Thông báo an ninh', N'Gần đây có một vài anh chị trong khu trọ sau khi lấy xe từ nhà xe quên khóa cửa, điều này cực kì nguy hiểm đến an ninh và tổn hại đến tài sản của những người khác. Ra quy định nếu ai sau khi lấy xe không đóng của nhà xe, sẽ check cam, ghi nhận và bị phạt từ 500k đến 1tr đồng. Nếu để xảy ra mất xe thì phải chịu trách nhiệm bồi thường toàn bộ xe bị mất. Anh chị em chú ý để đảm bảo giữ gìn tài sản của mình cũng như của anh chị khác sống trong khu trọ.', CAST(N'2022-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (21, 3, 1, N'Thông báo cúp điện', N'Theo thông tin từ công ty điện lực thì cuối tuần này vào thứ 7 sẽ cúp điện từ 7h sáng đến 17h chiều! Mọi người trong khu trọ chú ý để tránh ảnh hưởng đến sinh hoạt cũng như công việc.', CAST(N'2022-01-05T09:04:16.390' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (22, 3, 1, N'Tăng giá điện', N'Kể từ tháng sau, tức là tháng 3/2022 sẽ tăng giá điện của toàn bộ khu trọ từ 3000 vnd/kwh lên 3500kwh theo thông báo của công ty điện lực! Anh chị em sống trong khu trọ lưu ý nhé!', CAST(N'2022-02-12T17:29:58.363' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (23, 3, 1, N'Tăng giá nước ', N'Kể từ tháng sau, tức là tháng 5/2022 tăng giá nước từ 14000 vnd/m3 lên 16000 vnd/m3 theo giá mới của công ty nước! Mọi người trong khu trọ lưu ý để nắm bắt thông tin.', CAST(N'2022-04-12T17:31:58.550' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (24, 3, 1, N'Thông báo cúp điện ', N'Theo thông tin từ công ty điện lực thì cuối tuần này vào thứ 7 sẽ cúp điện từ 7h sáng đến 17h chiều! Mọi người trong khu trọ chú ý để tránh ảnh hưởng đến sinh hoạt cũng như công việc.', CAST(N'2022-04-22T17:33:28.717' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (25, 3, 1, N'Thông báo cúp nước/nước yếu', N'Theo thông tin nhận được thì công ty nước cần nâng cấp và bảo trì đường ống dẫn nước để bảo đảm lưu lượng cũng như nguồn nước đến người dân nên sẽ cúp nước vào các khung giờ từ 8h đến 11h và từ 13h đến 17h, từ 23h đêm đến 5h sáng các ngày từ ngày 14/06/2022 đến 18/06/2022. Mọi người chú ý có giải pháp dự trữ nước để tránh ảnh hưởng đến vệ sinh, sinh hoạt.', CAST(N'2022-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (26, 3, 1, N'Thông báo tu sửa phòng', N'Hiện tại tôi nhận được báo cáo có hiện tượng dột từ một số phòng nên sáng thứ 5 tuần này sẽ có đội ngũ thợ đến kiểm tra và khắc phục sự cố. Mọi người chú ý.', CAST(N'2022-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Notification] ([notification_id], [housemanager_id], [house_id], [title], [content], [create_date]) VALUES (27, 3, 1, N'Thông báo an ninh', N'Gần đây có một vài anh chị trong khu trọ sau khi lấy xe từ nhà xe quên khóa cửa, điều này cực kì nguy hiểm đến an ninh và tổn hại đến tài sản của những người khác. Ra quy định nếu ai sau khi lấy xe không đóng của nhà xe, sẽ check cam, ghi nhận và bị phạt từ 500k đến 1tr đồng. Nếu để xảy ra mất xe thì phải chịu trách nhiệm bồi thường toàn bộ xe bị mất. Anh chị em chú ý để đảm bảo giữ gìn tài sản của mình cũng như của anh chị khác sống trong khu trọ.', CAST(N'2022-06-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([payment_id], [payment_name]) VALUES (1, N'Tiền mặt')
INSERT [dbo].[Payment] ([payment_id], [payment_name]) VALUES (2, N'VNPay')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([post_id], [post_title], [post_text], [account_id], [create_date], [address], [phone], [price], [img], [status]) VALUES (1, N'Cho thuê phòng tại 47 Tân Mỹ, Đỗ Xuân Hợp, Nam Từ Liêm, 27-31m212', N'Cho thuê căn hộ chung cư mini cao cấp khép kín, tại 47 Tân Mỹ, đường Đỗ Xuân Hợp, Mỹ Đình 1, Quận Nam Từ Liêm (Ngay đằng sau sân vận động Mỹ Đình).Diện tích từ 27 đến 31 m2 kép kín có đầy đủ tiện nghi, thông thoát, cụ thể: 
- Vệ sinh khép kín; 
- Tủ đựng quần áo 3 buồng; giường đôi; nóng lạnh; quạt; bệ bếp; điều hoà; thùng đựng rác; internet; cầu thang máy; camera an ninh 
- Ban công phơi quần áo riêng biệt từng phòng. rèm, tủ bếp, đặc biệt đường rộng 18m
Giá cho thuê: (phù hợp với gia đình nhỏ ở lâu dài)
Từ 27- 31m2 giá: 3.500.000đ - 3.900.000đ
Liên hệ: 094.923196812', 2, CAST(N'2023-03-23' AS Date), N'54/37 Đường Bạch Đằng, Phường 2, Quận Tân Bình, Hồ Chí Minh1', N'09492319612', N'3.500.000đ - 3.900.000đ12', NULL, 1)
INSERT [dbo].[Post] ([post_id], [post_title], [post_text], [account_id], [create_date], [address], [phone], [price], [img], [status]) VALUES (2, N'Cho thuê phòng tại 47 Tân Mỹ, Đỗ Xuân Hợp, Nam Từ Liêm, 27-31m2', N'Cho thuê căn hộ chung cư mini cao cấp khép kín, tại 47 Tân Mỹ, đường Đỗ Xuân Hợp, Mỹ Đình 1, Quận Nam Từ Liêm (Ngay đằng sau sân vận động Mỹ Đình).Diện tích từ 27 đến 31 m2 kép kín có đầy đủ tiện nghi, thông thoát, cụ thể: 
- Vệ sinh khép kín; 
- Tủ đựng quần áo 3 buồng; giường đôi; nóng lạnh; quạt; bệ bếp; điều hoà; thùng đựng rác; internet; cầu thang máy; camera an ninh 
- Ban công phơi quần áo riêng biệt từng phòng. rèm, tủ bếp, đặc biệt đường rộng 18m
Giá cho thuê: (phù hợp với gia đình nhỏ ở lâu dài)
Từ 27- 31m2 giá: 3.500.000đ - 3.900.000đ
Liên hệ: 094.92319681', 2, CAST(N'2023-03-23' AS Date), N'54/37 Đường Bạch Đằng, Phường 2, Quận Tân Bình, Hồ Chí Minh1', N'0949231961', N'3.500.000đ - 3.900.000đ', NULL, 1)
INSERT [dbo].[Post] ([post_id], [post_title], [post_text], [account_id], [create_date], [address], [phone], [price], [img], [status]) VALUES (3, N'Phòng gác xép mới rộng rãi phù hợp nhóm đông sinh viên Mễ Trì 35m2', N'Phòng gác xép mới rộng rãi phù hợp nhóm đông sinh viên
🔰 Phòng gác xép rộng 35m² gần các tuyến đường Mễ Trì, Phạm Hùng, Đỗ Đức Dục
🔸 Điều hòa
🔸 Nóng lạnh.
🔸 Tủ quần áo 4 ngăn rộng rãi
🔸 Bàn bếp, tủ bếp, chậu rửa đẹp đầy đủ
🔸 Máy giặt
Gác xép siêu rộng ngủ 4-5 người thoải mái
Thiết bị vệ sinh hiện đại đầy đủ.
Nhà có bảo vệ 24/24, chỗ để xe rộng rãi, để 3-4 xe/phòng
Có khóa vân tay, giờ giấc tự do
Sân phơi rộng rãi view đẹp nhìn ra mặt khách sạn Mariot', 2, CAST(N'2023-03-23' AS Date), N'Mễ Trì, Phường Mễ Trì, Quận Nam Từ Liêm, Hà Nội', N'0821987925', N'5.000.000đ', NULL, 1)
INSERT [dbo].[Post] ([post_id], [post_title], [post_text], [account_id], [create_date], [address], [phone], [price], [img], [status]) VALUES (4, N'Trọ có BAN CÔNG,Gác cao 1m8- phan văn hớn,quận 12', N'🏡 Vị trí: Nguyễn Thị Thập, Q7🔥
Phòng giá 4tr500.
Có các phòng giá 5tr500 trở lên với các tiện nghi cao hơn.
----------------
👉Tiện ích: Giờ giấc tự do, Thang máy cao cấp, có camera an ninh.
👉Vị trí trong bán kính các cung đường gần các Trường Đại Học RMIT, Đại học Tôn Đức Thắng, Nguyễn Tất Thành.
Xem phòng 24/24. Liên hệ ngay để chọn thuê được phòng ưng ý.

✴️ Dễ dàng qua Nguyễn Thị Thập, Nguyễn Tất Thành Quận 4
✴️Ra vào thẻ từ, an ninh, trang bị sẵn máy lạnh, kệ bếp.

📞Mọi thông tin chi tiết xin liên hệ: 0777.077.612 để được tư vấn và đặt lịch xem phòng ngay💥💥
#chothue
#canhomini
#cănhominiq7', 3, CAST(N'2023-03-23' AS Date), N'Phan Văn Hớn, Tân Thới Nhất, Quận 12, Hà Nội2', N'0888444401', N'4.000.000đ', NULL, 1)
INSERT [dbo].[Post] ([post_id], [post_title], [post_text], [account_id], [create_date], [address], [phone], [price], [img], [status]) VALUES (5, N'Cho thuê phòng tại ngõ 7 Phùng Khoang (đầu đường Phùng Khoang)', N'- Vị trí giao thông thuận tiện, đầu Phùng Khoang, gần đường chính
- Gần các trường Y học cổ truyền, ĐH Hà Nội, Nghệ thuật TW, An Ninh,....
- Nội thất: Điều hòa, nóng lạnh, giường, tủ quần áo, bàn bếp, vskk, phơi đồ tầng thượng rộng rãi
👉Dịch vụ:
- Điện 3k5/số
- Nước 100k/người
- Mạng 100k/phòng
Tiện ích:
- Chỗ để xe rộng rãi, free xe tầng 1
- Không chung chủ, giờ giấc tự do thoải mái
- Khóa vân tay, camera 24/24
Liên hệ ngay 0989955365
', 3, CAST(N'2023-03-23' AS Date), N'Phan Văn Hớn, Tân Thới Nhất, Quận 12, Hà Nội', N'0888444401', N'4.100.000đ', NULL, 1)
INSERT [dbo].[Post] ([post_id], [post_title], [post_text], [account_id], [create_date], [address], [phone], [price], [img], [status]) VALUES (6, N'Trọ có BAN CÔNG,Gác cao 1m8- phan văn hớn,quận 12', N'Cho thuê căn hộ chung cư mini cao cấp khép kín, tại 47 Tân Mỹ, đường Đỗ Xuân Hợp, Mỹ Đình 1, Quận Nam Từ Liêm (Ngay đằng sau sân vận động Mỹ Đình).
Diện tích từ 27 đến 31 m2 kép kín có đầy đủ tiện nghi, thông thoát, cụ thể: Vệ sinh khép kín; tủ đựng quần áo 3 buồng; giường đôi; nóng lạnh; quạt; bệ bếp; điều hoà; thùng đựng rác; internet; cầu thang máy; camera an ninh; ban công phơi quần áo riêng biệt từng phòng. rèm, tủ bếp, đặc biệt đường rộng 18m
Giá cho thuê: (phù hợp với gia đình nhỏ ở lâu dài)
Từ 27- 31m2 giá: 3.500.000đ - 3.900.000đ
Liên hệ: 094.9231968', 3, CAST(N'2023-02-12' AS Date), N'
Phan Văn Hớn, Tân Thới Nhất, Quận 12, Hà Nội', N'0888444401', N'2.500.000', NULL, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
INSERT [dbo].[Room] ([room_id], [house_id], [room_number], [cus_name], [cus_email], [cus_phone], [status]) VALUES (1, 2, 101, N'Long1', N'long1@gmail.com', 123232323, 0)
INSERT [dbo].[Room] ([room_id], [house_id], [room_number], [cus_name], [cus_email], [cus_phone], [status]) VALUES (2, 2, 102, N'Long2', N'Long2@gmail.com', 121212121, 0)
INSERT [dbo].[Room] ([room_id], [house_id], [room_number], [cus_name], [cus_email], [cus_phone], [status]) VALUES (3, 2, 103, N'Long3', N'Long3@gmail.com', 454343434, 0)
INSERT [dbo].[Room] ([room_id], [house_id], [room_number], [cus_name], [cus_email], [cus_phone], [status]) VALUES (4, 27, 101, N'Long4', N'Long4@gmail.com', 2323223, 0)
INSERT [dbo].[Room] ([room_id], [house_id], [room_number], [cus_name], [cus_email], [cus_phone], [status]) VALUES (5, 27, 102, N'Long5', N'Long5@gmail.com', 76567657, 0)
INSERT [dbo].[Room] ([room_id], [house_id], [room_number], [cus_name], [cus_email], [cus_phone], [status]) VALUES (6, 27, 103, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (1, N'Điện', N'Kwh')
INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (2, N'Nước', N'm3')
INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (3, N'Wifi', N'phòng')
INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (4, N'Phí quản lý', N'phòng')
INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (6, N'Phí vệ sinh', N'phòng')
INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (7, N'Phí giữ xe', N'phòng')
INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (8, N'Phí bảo trì test', N'phòng')
INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (9, N'Phí test', N'Kwh')
INSERT [dbo].[Service] ([service_id], [service_name], [unit]) VALUES (10, N'Thuế nhà nước', N'phòng')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__F3DBC572529EBE2C]    Script Date: 3/25/2023 8:46:44 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Accounts__F3DBC572529EBE2C] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[House] ADD  CONSTRAINT [DF_House_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[AccountInformation]  WITH CHECK ADD  CONSTRAINT [FK__AccountIn__accou__48CFD27E] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[AccountInformation] CHECK CONSTRAINT [FK__AccountIn__accou__48CFD27E]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__payment_id__47DBAE45] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__payment_id__47DBAE45]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Room1] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Room1]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK__BillDetai__bill___40058253] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK__BillDetai__bill___40058253]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Accounts] FOREIGN KEY([housemanager_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Accounts]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Accounts1] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Accounts1]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Consumes] FOREIGN KEY([consumeIDStart])
REFERENCES [dbo].[Consume] ([consume_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Consumes]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Consumes1] FOREIGN KEY([consumeIDEnd])
REFERENCES [dbo].[Consume] ([consume_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Consumes1]
GO
ALTER TABLE [dbo].[BillService]  WITH CHECK ADD  CONSTRAINT [FK__BillServi__hoste__3D2915A8] FOREIGN KEY([houseservice_id])
REFERENCES [dbo].[HouseService] ([houseservice_id])
GO
ALTER TABLE [dbo].[BillService] CHECK CONSTRAINT [FK__BillServi__hoste__3D2915A8]
GO
ALTER TABLE [dbo].[BillService]  WITH CHECK ADD  CONSTRAINT [FK_BillService_BillDetail] FOREIGN KEY([billdetail_id])
REFERENCES [dbo].[BillDetail] ([billdetail_id])
GO
ALTER TABLE [dbo].[BillService] CHECK CONSTRAINT [FK_BillService_BillDetail]
GO
ALTER TABLE [dbo].[Consume]  WITH CHECK ADD  CONSTRAINT [FK_Consume_Room1] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Consume] CHECK CONSTRAINT [FK_Consume_Room1]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK__Contracts__hoste__59063A47] FOREIGN KEY([housemanager_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK__Contracts__hoste__59063A47]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK__Contracts__rente__59FA5E80] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK__Contracts__rente__59FA5E80]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Room1] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Room1]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_Account1] FOREIGN KEY([housemanager_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_Account1]
GO
ALTER TABLE [dbo].[HouseService]  WITH CHECK ADD  CONSTRAINT [FK__HostelSer__servi__5DCAEF64] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[HouseService] CHECK CONSTRAINT [FK__HostelSer__servi__5DCAEF64]
GO
ALTER TABLE [dbo].[HouseService]  WITH CHECK ADD  CONSTRAINT [FK_HouseService_House] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[HouseService] CHECK CONSTRAINT [FK_HouseService_House]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK__Notificat__hoste__5812160E] FOREIGN KEY([housemanager_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK__Notificat__hoste__5812160E]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_House] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_House]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Account]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room1_House] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room1_House]
GO
USE [master]
GO
ALTER DATABASE [HomeSharing1] SET  READ_WRITE 
GO
