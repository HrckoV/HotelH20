USE [LetoviH2O]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 21.1.2020. 17:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[Guest_ID] [int] NOT NULL,
	[Guest_UserName] [nvarchar](50) NOT NULL,
	[Guest_Password] [nvarchar](50) NOT NULL,
	[Guest_Email] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Letovi]    Script Date: 21.1.2020. 17:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Letovi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PolazniAerodrom] [nvarchar](50) NULL,
	[OdredisniAerodrom] [nvarchar](50) NULL,
	[DatumPolaska] [date] NULL,
	[DatumPovratka] [date] NULL,
	[BrojPutnika] [int] NULL,
	[Valuta] [nvarchar](50) NULL,
	[Cijena] [float] NULL,
 CONSTRAINT [PK_Flights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LetoviDolazni]    Script Date: 21.1.2020. 17:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LetoviDolazni](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PolazniAerodrom] [nvarchar](50) NULL,
 CONSTRAINT [PK_AirFilghtsCome] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LetoviOdlazni]    Script Date: 21.1.2020. 17:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LetoviOdlazni](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OdredisniAerodrom] [nvarchar](50) NULL,
 CONSTRAINT [PK_AirFlights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Guest] ([Guest_ID], [Guest_UserName], [Guest_Password], [Guest_Email]) VALUES (2, N'Hrcko', N'PmX6mtwKW+QJkEOiwT/xIQ==', N'hrcko@net.hr')
INSERT [dbo].[Guest] ([Guest_ID], [Guest_UserName], [Guest_Password], [Guest_Email]) VALUES (4, N'Mont', N'WZXBiq8AjZs=', N'mont@mail.com')
INSERT [dbo].[Guest] ([Guest_ID], [Guest_UserName], [Guest_Password], [Guest_Email]) VALUES (5, N'user', N'9zmak11flYYJkEOiwT/xIQ==', N'user@mail.com')
SET IDENTITY_INSERT [dbo].[Letovi] ON 

INSERT [dbo].[Letovi] ([ID], [PolazniAerodrom], [OdredisniAerodrom], [DatumPolaska], [DatumPovratka], [BrojPutnika], [Valuta], [Cijena]) VALUES (1, N'ABG', N'LON', CAST(N'2019-02-12' AS Date), CAST(N'2019-02-16' AS Date), 3, N'HRK', 345.55)
INSERT [dbo].[Letovi] ([ID], [PolazniAerodrom], [OdredisniAerodrom], [DatumPolaska], [DatumPovratka], [BrojPutnika], [Valuta], [Cijena]) VALUES (2, N'BBG', N'KAE', CAST(N'2020-01-15' AS Date), CAST(N'2020-01-23' AS Date), 4, N'EUR', 145.55)
INSERT [dbo].[Letovi] ([ID], [PolazniAerodrom], [OdredisniAerodrom], [DatumPolaska], [DatumPovratka], [BrojPutnika], [Valuta], [Cijena]) VALUES (3, N'AAM', N'ABS', CAST(N'2020-01-08' AS Date), CAST(N'2020-01-09' AS Date), 2, N'EUR', 223.34)
INSERT [dbo].[Letovi] ([ID], [PolazniAerodrom], [OdredisniAerodrom], [DatumPolaska], [DatumPovratka], [BrojPutnika], [Valuta], [Cijena]) VALUES (4, N'AAH', N'LKD', CAST(N'2020-02-15' AS Date), CAST(N'2020-02-17' AS Date), 3, N'USD', 112.23)
SET IDENTITY_INSERT [dbo].[Letovi] OFF
SET IDENTITY_INSERT [dbo].[LetoviDolazni] ON 

INSERT [dbo].[LetoviDolazni] ([ID], [PolazniAerodrom]) VALUES (1, N'ABG')
INSERT [dbo].[LetoviDolazni] ([ID], [PolazniAerodrom]) VALUES (2, N'BBG')
INSERT [dbo].[LetoviDolazni] ([ID], [PolazniAerodrom]) VALUES (3, N'AAM')
INSERT [dbo].[LetoviDolazni] ([ID], [PolazniAerodrom]) VALUES (4, N'AAH')
SET IDENTITY_INSERT [dbo].[LetoviDolazni] OFF
SET IDENTITY_INSERT [dbo].[LetoviOdlazni] ON 

INSERT [dbo].[LetoviOdlazni] ([ID], [OdredisniAerodrom]) VALUES (1, N'LON')
INSERT [dbo].[LetoviOdlazni] ([ID], [OdredisniAerodrom]) VALUES (2, N'KAE')
INSERT [dbo].[LetoviOdlazni] ([ID], [OdredisniAerodrom]) VALUES (3, N'ABS')
INSERT [dbo].[LetoviOdlazni] ([ID], [OdredisniAerodrom]) VALUES (4, N'LKD')
SET IDENTITY_INSERT [dbo].[LetoviOdlazni] OFF
/****** Object:  StoredProcedure [dbo].[DohvatiLetDol]    Script Date: 21.1.2020. 17:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DohvatiLetDol]
AS

BEGIN

SELECT ID,PolazniAerodrom
FROM LetoviDolazni
ORDER BY ID


END
GO
/****** Object:  StoredProcedure [dbo].[DohvatiLetOdl]    Script Date: 21.1.2020. 17:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DohvatiLetOdl]
AS

BEGIN

SELECT ID,OdredisniAerodrom
FROM LetoviOdlazni
ORDER BY ID


END
GO
/****** Object:  StoredProcedure [dbo].[DohvatiLetove]    Script Date: 21.1.2020. 17:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DohvatiLetove]
@PolazniAerodrom nvarchar(50),
@OdredisniAerodrom nvarchar(50),
@DatumPolaska datetime,
@DatumPovratka datetime,
@BrojPutnika int,
@Valuta nvarchar(50)

AS

BEGIN

SELECT ID,PolazniAerodrom,OdredisniAerodrom,DatumPolaska,DatumPovratka,BrojPutnika,Valuta,Cijena
FROM Letovi
WHERE PolazniAerodrom=@PolazniAerodrom OR OdredisniAerodrom = @OdredisniAerodrom OR
TRY_CONVERT(date, DatumPolaska, 103)= TRY_CONVERT(date, @DatumPolaska, 103) AND
TRY_CONVERT(date, DatumPovratka, 103)= TRY_CONVERT(date, @DatumPovratka, 103)
OR BrojPutnika=@BrojPutnika OR Valuta=@Valuta 
ORDER BY ID


END
GO
/****** Object:  StoredProcedure [dbo].[GetUserLoginData]    Script Date: 21.1.2020. 17:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetUserLoginData]
	@GuestName varchar(50),@GuestPassword varchar(50)
AS
BEGIN
	SELECT Guest_ID,Guest_UserName
	FROM Guest
	Where Guest_UserName = @GuestName AND Guest_Password = @GuestPassword
END
GO
