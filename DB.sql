USE [master]
GO
/****** Object:  Database [lab1_hanaShop]    Script Date: 1/7/2021 7:15:14 PM ******/
CREATE DATABASE [lab1_hanaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lab1_hanaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\lab1_hanaShop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'lab1_hanaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\lab1_hanaShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [lab1_hanaShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lab1_hanaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lab1_hanaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lab1_hanaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lab1_hanaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lab1_hanaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lab1_hanaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lab1_hanaShop] SET  MULTI_USER 
GO
ALTER DATABASE [lab1_hanaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lab1_hanaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lab1_hanaShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [lab1_hanaShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [lab1_hanaShop]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 1/7/2021 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ImportedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 1/7/2021 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NOT NULL,
	[FoodId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_BookingDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/7/2021 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 1/7/2021 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[foodId] [int] IDENTITY(1,1) NOT NULL,
	[foodname] [nvarchar](50) NOT NULL,
	[foodPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoriId] [int] NOT NULL,
	[description] [nvarchar](350) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[imageLink] [nvarchar](50) NULL,
	[statusId] [int] NOT NULL,
	[updateDate] [datetime] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[foodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 1/7/2021 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[StatusId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/7/2021 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 1/7/2021 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Cake')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Candy')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Coffee')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (2, N'Noodle', 10000, 4, 1, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (3, N'bun', 10000, 5, 1, N'Nice', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (4, N'banh quy', 10000, 6, 1, N'cool', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (5, N'keo lac', 10000, 7, 1, N'ngon', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (6, N'sua', 10000, 8, 1, N'them', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (7, N'banh trung', 10000, 9, 1, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (8, N'banh bong lan', 10000, 10, 1, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (9, N'keo deo', 10000, 10, 2, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (10, N'keo ho lo', 10000, 10, 2, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (11, N'keo chuoi', 10000, 10, 2, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (12, N'banh trang nuong', 66666, 10, 1, N'very good', CAST(N'2021-01-15 11:02:47.733' AS DateTime), N'img/ZYL9B6YEMB53XPF.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (13, N'banh me cuoi', 15200, 5, 1, N'Good For Everyone', CAST(N'2021-01-20 11:18:26.900' AS DateTime), N'img/2.jpg', 1, CAST(N'2021-01-07 11:00:04.610' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (14, N'Hi cc', 55555, 5555, 1, N'5555', CAST(N'2021-01-20 10:28:13.937' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (15, N'HI ban', 6666, 456, 1, N'NGON LAM', CAST(N'2021-01-09 09:42:32.290' AS DateTime), N'img/1.jpg', 1, CAST(N'2021-01-07 11:13:37.477' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([Id], [Username], [Name], [Password], [StatusId], [RoleId]) VALUES (1, N'long', N'Đồng Hữu Long', N'123', 1, 1)
INSERT [dbo].[Registration] ([Id], [Username], [Name], [Password], [StatusId], [RoleId]) VALUES (2, N'van', N'Lê Thanh Vân', N'123', 1, 2)
SET IDENTITY_INSERT [dbo].[Registration] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Inactive')
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Registration] FOREIGN KEY([UserId])
REFERENCES [dbo].[Registration] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Registration]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Booking] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([Id])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Booking]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Food] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Food] ([foodId])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Food]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Category] FOREIGN KEY([categoriId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Category]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Registration] FOREIGN KEY([userId])
REFERENCES [dbo].[Registration] ([Id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Registration]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Status] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Status]
GO
USE [master]
GO
ALTER DATABASE [lab1_hanaShop] SET  READ_WRITE 
GO
