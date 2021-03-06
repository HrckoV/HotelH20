USE [master]
GO
/****** Object:  Database [HotelH20]    Script Date: 26.6.2019. 8:26:22 ******/
CREATE DATABASE [HotelH20]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelH20', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.HRVVODA\MSSQL\DATA\HotelH20.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelH20_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.HRVVODA\MSSQL\DATA\HotelH20_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HotelH20] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelH20].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelH20] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelH20] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelH20] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelH20] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelH20] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelH20] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelH20] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelH20] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelH20] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelH20] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelH20] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelH20] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelH20] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelH20] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelH20] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelH20] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelH20] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelH20] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelH20] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelH20] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelH20] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelH20] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelH20] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelH20] SET  MULTI_USER 
GO
ALTER DATABASE [HotelH20] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelH20] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelH20] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelH20] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelH20] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelH20', N'ON'
GO
ALTER DATABASE [HotelH20] SET QUERY_STORE = OFF
GO
USE [HotelH20]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Booking_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date_From] [datetime] NOT NULL,
	[Date_To] [datetime] NOT NULL,
	[Guest_ID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[City_ID] [int] IDENTITY(1,1) NOT NULL,
	[City_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[Guest_ID] [int] IDENTITY(1,1) NOT NULL,
	[Guest_UserName] [nvarchar](50) NOT NULL,
	[Guest_Password] [nvarchar](50) NOT NULL,
	[Guest_Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[Guest_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Hotel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Hotel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel_City]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel_City](
	[Hotel_ID] [int] NOT NULL,
	[City_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Room_ID] [int] IDENTITY(1,1) NOT NULL,
	[Hotel_ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Number_Of_Beds] [int] NOT NULL,
	[Price_Per_Night] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Room_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Booking]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Booking](
	[Booking_ID] [int] NOT NULL,
	[Room_ID] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Booking_ID], [Date_From], [Date_To], [Guest_ID], [Created], [Price]) VALUES (3, CAST(N'2019-06-22T00:00:00.000' AS DateTime), CAST(N'2019-07-21T00:00:00.000' AS DateTime), 2, CAST(N'2019-06-25T11:57:45.283' AS DateTime), CAST(8700.00 AS Decimal(18, 2)))
INSERT [dbo].[Booking] ([Booking_ID], [Date_From], [Date_To], [Guest_ID], [Created], [Price]) VALUES (7, CAST(N'2019-07-01T00:00:00.000' AS DateTime), CAST(N'2019-07-10T00:00:00.000' AS DateTime), 2, CAST(N'2019-06-25T19:30:33.257' AS DateTime), CAST(3960.00 AS Decimal(18, 2)))
INSERT [dbo].[Booking] ([Booking_ID], [Date_From], [Date_To], [Guest_ID], [Created], [Price]) VALUES (11, CAST(N'2019-06-29T00:00:00.000' AS DateTime), CAST(N'2019-07-06T00:00:00.000' AS DateTime), 4, CAST(N'2019-06-25T21:53:18.913' AS DateTime), CAST(3850.00 AS Decimal(18, 2)))
INSERT [dbo].[Booking] ([Booking_ID], [Date_From], [Date_To], [Guest_ID], [Created], [Price]) VALUES (13, CAST(N'2019-06-15T00:00:00.000' AS DateTime), CAST(N'2019-06-22T00:00:00.000' AS DateTime), 2, CAST(N'2019-06-25T22:46:19.297' AS DateTime), CAST(2100.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (1, N'Zadar')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (2, N'Primošten')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (3, N'Porec')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (4, N'Biograd na moru')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (5, N'Šibenik')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (6, N'Split')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (7, N'Pag')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (8, N'Novalja')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (9, N'Crikvenica')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (10, N'Vodice')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([Guest_ID], [Guest_UserName], [Guest_Password], [Guest_Email]) VALUES (2, N'Hrcko', N'PmX6mtwKW+QJkEOiwT/xIQ==', N'hrcko@net.hr')
INSERT [dbo].[Guest] ([Guest_ID], [Guest_UserName], [Guest_Password], [Guest_Email]) VALUES (4, N'Mont', N'WZXBiq8AjZs=', N'mont@mail.com')
SET IDENTITY_INSERT [dbo].[Guest] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (1, N'Mediteran')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (2, N'Niko')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (3, N'Kalelarga')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (4, N'Porto')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (5, N'Diadora')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (6, N'Zora')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (7, N'Perla')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (8, N'Spongiola')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (9, N'Niko')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (10, N'Life')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (11, N'Valamar Diamant')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (12, N'Valamar Pinia')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (13, N'Valamar Zagreb')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (14, N'Valamar Tamaris')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (15, N'Valamar Riviera')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (16, N'Ilirija')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (17, N'Kornati')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (18, N'Adriatic')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (19, N'Villa Donat')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (20, N'Villa Primorje')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (21, N'Life Palace')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (22, N'Vrata Krke')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (23, N'Jadran')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (24, N'Jakov')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (25, N'Jure')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (26, N'Cornaro')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (27, N'Galeria Valeria')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (28, N'Fanat')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (29, N'Dioklecijan')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (30, N'Atrium')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (31, N'Pagus')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (32, N'Magdalena')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (33, N'Belveder')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (34, N'Smokva')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (35, N'Tony')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (36, N'In Excelsis')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (37, N'Bok')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (38, N'Villa Cassia')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (39, N'Olea')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (40, N'La Luna Island')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (41, N'Kastel')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (42, N'Park')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (43, N'Omorika')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (44, N'Katarina')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (45, N'Dramalj')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (46, N'Flora & Madera')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (47, N'Stella Maris')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (48, N'Miramare')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (49, N'Olympia Sky')
INSERT [dbo].[Hotel] ([Hotel_ID], [Name]) VALUES (50, N'Villa Radin')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (1, 1)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (2, 1)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (3, 1)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (4, 1)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (5, 1)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (6, 2)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (7, 2)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (8, 2)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (9, 2)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (10, 2)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (11, 3)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (12, 3)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (13, 3)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (14, 3)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (15, 3)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (16, 4)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (17, 4)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (18, 4)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (19, 4)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (20, 4)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (21, 5)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (22, 5)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (23, 5)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (24, 5)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (25, 5)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (26, 6)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (27, 6)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (28, 6)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (29, 6)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (30, 6)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (31, 7)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (32, 7)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (33, 7)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (34, 7)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (35, 7)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (36, 8)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (37, 8)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (38, 8)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (39, 8)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (40, 8)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (41, 9)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (42, 9)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (43, 9)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (44, 9)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (45, 9)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (46, 10)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (47, 10)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (48, 10)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (49, 10)
INSERT [dbo].[Hotel_City] ([Hotel_ID], [City_ID]) VALUES (50, 10)
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (1, 1, N'2 krevetna morska strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (3, 1, N'2 krevetna park strana', 3, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (4, 2, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (5, 2, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (6, 3, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (7, 3, N'2 krevetna balkon', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (8, 4, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (9, 4, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (12, 5, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (13, 5, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (14, 6, N'2 krevetna morska strana', 2, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (15, 6, N'2 krevetna balkon', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (16, 7, N'2 krevetna morska strana', 3, CAST(440.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (17, 7, N'2 krevetna park strana', 2, CAST(550.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (18, 8, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (19, 8, N'2 krevetna balkon ', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (20, 9, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (21, 9, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (22, 10, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (23, 10, N'2 krevetna balkon', 3, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (24, 11, N'2 krevetna morska strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (25, 11, N'2 krevetna park strana', 3, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (26, 12, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (27, 12, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (28, 13, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (29, 13, N'2 krevetna balkon', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (30, 14, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (31, 14, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (32, 15, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (33, 15, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (34, 16, N'2 krevetna morska strana', 2, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (35, 16, N'2 krevetna balkon', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (36, 17, N'2 krevetna morska strana', 3, CAST(440.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (37, 17, N'2 krevetna park strana', 2, CAST(550.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (38, 18, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (39, 18, N'2 krevetna balkon ', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (40, 19, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (41, 19, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (42, 20, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (43, 20, N'2 krevetna balkon', 3, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (44, 21, N'2 krevetna morska strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (45, 21, N'2 krevetna park strana', 3, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (46, 22, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (47, 22, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (48, 23, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (49, 23, N'2 krevetna balkon', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (50, 24, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (51, 24, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (52, 25, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (53, 25, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (54, 26, N'2 krevetna morska strana', 2, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (55, 26, N'2 krevetna balkon', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (56, 27, N'2 krevetna morska strana', 3, CAST(440.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (57, 27, N'2 krevetna park strana', 2, CAST(550.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (58, 28, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (59, 28, N'2 krevetna balkon ', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (60, 29, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (61, 29, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (62, 30, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (63, 30, N'2 krevetna balkon', 3, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (64, 31, N'2 krevetna morska strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (65, 31, N'2 krevetna park strana', 3, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (66, 32, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (67, 32, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (68, 33, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (69, 33, N'2 krevetna balkon', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (70, 34, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (71, 34, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (72, 35, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (73, 35, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (74, 36, N'2 krevetna morska strana', 2, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (75, 36, N'2 krevetna balkon', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (76, 37, N'2 krevetna morska strana', 3, CAST(440.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (77, 37, N'2 krevetna park strana', 2, CAST(550.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (78, 38, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (79, 38, N'2 krevetna balkon ', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (80, 39, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (81, 39, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (82, 40, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (83, 40, N'2 krevetna balkon', 3, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (84, 41, N'2 krevetna morska strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (85, 41, N'2 krevetna park strana', 3, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (86, 42, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (87, 42, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (88, 43, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (89, 43, N'2 krevetna balkon', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (90, 44, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (91, 44, N'2 krevetna park strana', 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (92, 45, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (93, 45, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (94, 46, N'2 krevetna morska strana', 2, CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (95, 46, N'2 krevetna balkon', 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (96, 47, N'2 krevetna morska strana', 3, CAST(440.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (97, 47, N'2 krevetna park strana', 2, CAST(550.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (98, 48, N'2 krevetna morska strana', 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (99, 48, N'2 krevetna balkon ', 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (100, 49, N'2 krevetna morska strana', 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (101, 49, N'2 krevetna park strana', 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (102, 50, N'2 krevetna morska strana', 2, CAST(400.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Room] ([Room_ID], [Hotel_ID], [Name], [Number_Of_Beds], [Price_Per_Night]) VALUES (103, 50, N'2 krevetna balkon', 3, CAST(450.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[Room_Booking] ([Booking_ID], [Room_ID]) VALUES (2, 0)
INSERT [dbo].[Room_Booking] ([Booking_ID], [Room_ID]) VALUES (3, 27)
INSERT [dbo].[Room_Booking] ([Booking_ID], [Room_ID]) VALUES (4, 42)
INSERT [dbo].[Room_Booking] ([Booking_ID], [Room_ID]) VALUES (5, 42)
INSERT [dbo].[Room_Booking] ([Booking_ID], [Room_ID]) VALUES (6, 14)
INSERT [dbo].[Room_Booking] ([Booking_ID], [Room_ID]) VALUES (11, 17)
INSERT [dbo].[Room_Booking] ([Booking_ID], [Room_ID]) VALUES (13, 61)
INSERT [dbo].[Room_Booking] ([Booking_ID], [Room_ID]) VALUES (7, 36)
/****** Object:  StoredProcedure [dbo].[DeleteBooking]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBooking]
	-- Add the parameters for the stored procedure here
	@Booking_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM Booking
	WHERE Booking_ID =  @Booking_ID

	DELETE FROM Room_Booking
	WHERE Booking_ID = @Booking_ID

END
GO
/****** Object:  StoredProcedure [dbo].[GetBookedRooms]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBookedRooms]
@GuestID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT h.Name hotel,r.Room_ID,r.Name room ,r.Number_Of_Beds,r.Price_Per_Night,b.Booking_ID,
	FORMAT ( b.Date_From, 'd', 'de-de' ) DateFrom,FORMAT ( b.Date_To, 'd', 'de-de' ) DateTo,b.Price
	FROM Room r
	INNER JOIN Room_Booking rb
	ON rb.Room_ID = r.Room_ID
	INNER JOIN Booking b
	ON b.Booking_ID = rb.Booking_ID
	INNER JOIN Hotel h
	ON h.Hotel_ID = r.Hotel_ID
	WHERE b.Guest_ID = @GuestID

END
GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCity]
	
AS
BEGIN
	SELECT city_id,city_name
	FROM City 
	Order by city_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetHotel]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetHotel]
	
AS
BEGIN
	SELECT Hotel_ID,name Hotel_Name
	FROM Hotel 
	Order by name
END
GO
/****** Object:  StoredProcedure [dbo].[GetHotelForCity]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetHotelForCity]
	@City_ID int
AS
BEGIN
	SELECT h.hotel_id,h.name Hotel_Name
	FROM Hotel h
	INNER JOIN Hotel_City hc
	on hc.Hotel_ID = h.Hotel_ID
	where hc.City_ID = @City_ID
	Order by h.name
END
GO
/****** Object:  StoredProcedure [dbo].[GetRooms]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRooms]
	@Hotel_ID int
AS
BEGIN
	SELECT Room_ID,Name,Number_Of_Beds,Price_Per_Night
	FROM Room
	WHERE Hotel_ID = @Hotel_ID	
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoomsForHotel]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRoomsForHotel]
	@GuestID int,@HotelID int
AS
BEGIN
	SELECT r.Name,r.Number_Of_Beds, r.Price_Per_Night
	FROM Room r
	INNER JOIN Hotel h
	on h.Hotel_ID = r.Hotel_ID
	WHERE r.Hotel_ID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserLoginData]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserLoginData]
	@GuestName varchar(50),@GuestPassword varchar(50)
AS
BEGIN
	SELECT Guest_ID,Guest_UserName
	FROM Guest
	Where Guest_UserName = @GuestName AND Guest_Password = @GuestPassword
END
GO
/****** Object:  StoredProcedure [dbo].[SaveBooking]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveBooking]
    @Guest_ID int,
	@Room_ID int,
	@Date_To datetime,
	@Date_From datetime,	
	@Price decimal(18,2)
AS
BEGIN
	DECLARE @BookingID int	

	SET @Price = @Price * (SELECT DATEDIFF(day,@Date_From,@Date_To));
	
	INSERT INTO Booking
	(Date_From,Date_To,Guest_ID,Created,Price)
	VALUES
	(@Date_From,@Date_To,@Guest_ID,sysdatetime(),@Price)

	SET @BookingID = (SELECT TOP 1 Booking_ID FROM Booking ORDER BY Created DESC);

	INSERT INTO Room_Booking
	(Booking_ID,Room_ID)
	VALUES
	(@BookingID,@Room_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBooking]    Script Date: 26.6.2019. 8:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBooking]
	-- Add the parameters for the stored procedure here
	@Booking_ID int,	
	@Price decimal(18,2),
	@Date_From datetime,
	@Date_To datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @TotalPrice decimal(18,2)

	SET @TotalPrice = @Price * (SELECT DATEDIFF(day,@Date_From,@Date_To));

    UPDATE Booking
	SET Date_To = @Date_To,
	    Date_From = @Date_From,
		Price = @TotalPrice
	WHERE Booking_ID = @Booking_ID

END
GO
USE [master]
GO
ALTER DATABASE [HotelH20] SET  READ_WRITE 
GO
