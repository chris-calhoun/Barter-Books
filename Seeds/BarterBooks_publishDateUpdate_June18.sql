USE [master]
GO
/****** Object:  Database [BarterBooks]    Script Date: 6/18/2021 9:53:00 PM ******/
CREATE DATABASE [BarterBooks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BarterBooks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BarterBooks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BarterBooks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BarterBooks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BarterBooks] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BarterBooks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BarterBooks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BarterBooks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BarterBooks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BarterBooks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BarterBooks] SET ARITHABORT OFF 
GO
ALTER DATABASE [BarterBooks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BarterBooks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BarterBooks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BarterBooks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BarterBooks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BarterBooks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BarterBooks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BarterBooks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BarterBooks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BarterBooks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BarterBooks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BarterBooks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BarterBooks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BarterBooks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BarterBooks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BarterBooks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BarterBooks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BarterBooks] SET RECOVERY FULL 
GO
ALTER DATABASE [BarterBooks] SET  MULTI_USER 
GO
ALTER DATABASE [BarterBooks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BarterBooks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BarterBooks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BarterBooks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BarterBooks] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BarterBooks', N'ON'
GO
ALTER DATABASE [BarterBooks] SET QUERY_STORE = OFF
GO
USE [BarterBooks]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 6/18/2021 9:53:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CollectionId] [int] NOT NULL,
	[Name] [varchar](max) NULL,
	[Image] [varchar](1000) NULL,
	[Author] [varchar](100) NULL,
	[PublishDate] [varchar](20) NOT NULL,
	[PageCount] [int] NOT NULL,
	[DateAddedToCollection] [datetime] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 6/18/2021 9:53:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follower]    Script Date: 6/18/2021 9:53:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follower](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[FollowerId] [varchar](50) NULL,
	[FollowedDate] [datetime] NULL,
 CONSTRAINT [PK_Follower] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trade]    Script Date: 6/18/2021 9:53:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trade](
	[Id] [int] NOT NULL,
	[TradeDate] [datetime] NULL,
	[BookOneId] [int] NULL,
	[BookTwoId] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Trade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/18/2021 9:53:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ImageUrl] [varchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 6/18/2021 9:53:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NOT NULL,
	[BookId] [int] NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (1, 7, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', N'Feb  2 2017 12:00AM', 64, CAST(N'2021-06-18T17:29:39.330' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (2, 7, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', N'Feb  2 2017 12:00AM', 64, CAST(N'2021-06-18T17:30:06.143' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (3, 7, N'Harry Potter Coloring Book', N'http://books.google.com/books/content?id=lMM4jgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Inc. Scholastic', N'Nov 10 2015 12:00AM', 96, CAST(N'2021-06-18T17:30:21.167' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (4, 7, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', N'Feb  2 2017 12:00AM', 64, CAST(N'2021-06-18T18:41:52.877' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (5, 7, N'Harry Potter Coloring Book', N'http://books.google.com/books/content?id=lMM4jgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Inc. Scholastic', N'Nov 10 2015 12:00AM', 96, CAST(N'2021-06-18T18:41:54.627' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (6, 7, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', N'Feb  2 2017 12:00AM', 64, CAST(N'2021-06-18T18:42:48.710' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (7, 7, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', N'Feb  2 2017 12:00AM', 64, CAST(N'2021-06-18T18:43:15.080' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (8, 7, N'Harry Potter Coloring Book', N'http://books.google.com/books/content?id=lMM4jgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Inc. Scholastic', N'Nov 10 2015 12:00AM', 96, CAST(N'2021-06-18T18:43:20.287' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (9, 7, N'Exploratory Software Testing', N'http://books.google.com/books/content?id=BsB0NpkcdgIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'James A. Whittaker', N'Aug 25 2009 12:00AM', 256, CAST(N'2021-06-18T18:45:29.710' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (10, 7, N'Property-Based Testing with PropEr, Erlang, and Elixir', N'http://books.google.com/books/content?id=IM-GDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Fred Hebert', N'Jan 17 2019 12:00AM', 376, CAST(N'2021-06-18T18:45:30.727' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (11, 7, N'Exploratory Software Testing', N'http://books.google.com/books/content?id=BsB0NpkcdgIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'James A. Whittaker', N'Aug 25 2009 12:00AM', 256, CAST(N'2021-06-18T18:47:32.680' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (12, 6, N'Property-Based Testing with PropEr, Erlang, and Elixir', N'http://books.google.com/books/content?id=IM-GDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Fred Hebert', N'Jan 17 2019 12:00AM', 376, CAST(N'2021-06-18T18:49:47.330' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (13, 6, N'Exploratory Software Testing', N'http://books.google.com/books/content?id=BsB0NpkcdgIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'James A. Whittaker', N'Aug 25 2009 12:00AM', 256, CAST(N'2021-06-18T18:49:48.600' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (14, 6, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', N'Feb  2 2017 12:00AM', 64, CAST(N'2021-06-18T19:19:26.680' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (15, 6, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', N'Feb  2 2017 12:00AM', 64, CAST(N'2021-06-18T19:47:23.930' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (16, 6, N'Harry Potter Coloring Book', N'http://books.google.com/books/content?id=lMM4jgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Inc. Scholastic', N'Nov 10 2015 12:00AM', 96, CAST(N'2021-06-18T19:53:58.400' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (17, 6, N'Quick Calculus', N'http://books.google.com/books/content?id=RFTdDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Daniel Kleppner, Norman Ramsey', N'Nov 11 1985 12:00AM', 272, CAST(N'2021-06-18T20:00:03.860' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (18, 6, N'College Physics', N'http://books.google.com/books/content?id=C9GQMwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Paul Peter Urone', N'Jan  1 1998 12:00AM', 893, CAST(N'2021-06-18T20:21:45.200' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (19, 6, N'Rich Dad, Poor Dad', N'http://books.google.com/books/content?id=Cx6aDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Robert T. Kiyosaki', N'May 25 2019 12:00AM', 104, CAST(N'2021-06-18T20:27:08.233' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (20, 7, N'AP® U.S. History Crash Course Book + Online', N'http://books.google.com/books/content?id=pTZkBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Larry Krieger, Gregory Feldmeth', N'Jan 19 2015 12:00AM', 272, CAST(N'2021-06-18T21:06:59.950' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (21, 7, N'Harry Potter Coloring Book', N'http://books.google.com/books/content?id=lMM4jgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Inc. Scholastic', N'Nov 10 2015 12:00AM', 96, CAST(N'2021-06-18T21:35:45.580' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (22, 7, N'Nashville', N'http://books.google.com/books/content?id=A3xLDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Ann Patchett, Heidi Ross', N'Nov 13 2018 12:00AM', 208, CAST(N'2021-06-18T21:35:57.817' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (23, 7, N'Quick Calculus', N'http://books.google.com/books/content?id=RFTdDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Daniel Kleppner, Norman Ramsey', N'Nov 11 1985 12:00AM', 272, CAST(N'2021-06-18T21:36:13.883' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (24, 7, N'The New Geography of Jobs', N'http://books.google.com/books/content?id=mxFMI7XWMzEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Enrico Moretti', N'May 22 2012 12:00AM', 304, CAST(N'2021-06-18T21:37:11.610' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (25, 7, N'Prisoners of Geography', N'http://books.google.com/books/content?id=46cxDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Tim Marshall', N'Oct 11 2016 12:00AM', 320, CAST(N'2021-06-18T21:38:18.120' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (26, 7, N'Key Concepts in Geography', N'http://books.google.com/books/content?id=EUvOviwwc2cC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Nicholas Clifford, Sarah Holloway, Stephen P Rice, Gill Valentine', N'Dec 12 2008 12:00AM', 480, CAST(N'2021-06-18T21:38:19.260' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (27, 7, N'The New Geography of Jobs', N'http://books.google.com/books/content?id=mxFMI7XWMzEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Enrico Moretti', N'May 22 2012 12:00AM', 304, CAST(N'2021-06-18T21:38:24.910' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (28, 7, N'Key Concepts in Geography', N'http://books.google.com/books/content?id=EUvOviwwc2cC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Nicholas Clifford, Sarah Holloway, Stephen P Rice, Gill Valentine', N'Dec 12 2008 12:00AM', 480, CAST(N'2021-06-18T21:39:47.407' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (29, 7, N'Prisoners of Geography', N'http://books.google.com/books/content?id=46cxDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Tim Marshall', N'Oct 11 2016 12:00AM', 320, CAST(N'2021-06-18T21:39:48.440' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (30, 7, N'The New Geography of Jobs', N'http://books.google.com/books/content?id=mxFMI7XWMzEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Enrico Moretti', N'May 22 2012 12:00AM', 304, CAST(N'2021-06-18T21:39:52.437' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (31, 7, N'The New Geography of Jobs', N'http://books.google.com/books/content?id=mxFMI7XWMzEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Enrico Moretti', N'May 22 2012 12:00AM', 304, CAST(N'2021-06-18T21:47:11.217' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (32, 7, N'Key Concepts in Geography', N'http://books.google.com/books/content?id=EUvOviwwc2cC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Nicholas Clifford, Sarah Holloway, Stephen P Rice, Gill Valentine', N'Dec 12 2008 12:00AM', 480, CAST(N'2021-06-18T21:47:50.060' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (33, 7, N'Prisoners of Geography', N'http://books.google.com/books/content?id=46cxDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Tim Marshall', N'Oct 11 2016 12:00AM', 320, CAST(N'2021-06-18T21:47:54.983' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (34, 7, N'Quick Calculus', N'http://books.google.com/books/content?id=RFTdDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', N'Daniel Kleppner, Norman Ramsey', N'Nov 11 1985 12:00AM', 272, CAST(N'2021-06-18T21:48:15.547' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (35, 7, N'How I Learned Geography', N'http://books.google.com/books/content?id=lmglAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Uri Shulevitz', N'2008-04', 32, CAST(N'2021-06-18T21:51:11.180' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (36, 7, N'Introduction to Human Geography', N'http://books.google.com/books/content?id=BrzlvQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'David Dorrell, Joseph P. Henderson', N'2018-10', 286, CAST(N'2021-06-18T21:51:15.070' AS DateTime))
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Collection] ON 

INSERT [dbo].[Collection] ([Id], [UserId], [Description]) VALUES (6, N'0kBxbnY7axWKqUYSxRA4m7POjEG3', N'test')
INSERT [dbo].[Collection] ([Id], [UserId], [Description]) VALUES (7, N'AnwNpDQS2dRHyw8g7Il3h6fS8IH3', N'test')
SET IDENTITY_INSERT [dbo].[Collection] OFF
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate]) VALUES (N'0kBxbnY7axWKqUYSxRA4m7POjEG3', N'Nashville', N'`Shine', N'nashvilleshineulti@gmail.com', N'https://lh3.googleusercontent.com/a-/AOh14Gjy75CfFWZUv9k-aHWdvILZpEymX8SV3t3dwRMQ=s96-c', CAST(N'2021-06-18T16:49:30.893' AS DateTime))
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate]) VALUES (N'AnwNpDQS2dRHyw8g7Il3h6fS8IH3', N'Chris', N'Calhoun', N'ctcalhoun2@gmail.com', N'https://lh3.googleusercontent.com/a-/AOh14Gi5h6uFHZNObdQUriZsfkA3L5-7Yy5mBbIS0hbvkg=s96-c', CAST(N'2021-06-18T16:50:55.347' AS DateTime))
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate]) VALUES (N'VIDavWsDEUMr1SsHjdhOQQuOxHy2', N'Chris', N'Calhoun', N'ctcalhoun2@gmail.com', N'https://lh3.googleusercontent.com/a-/AOh14Gi5h6uFHZNObdQUriZsfkA3L5-7Yy5mBbIS0hbvkg=s96-c', CAST(N'2021-06-18T16:47:15.197' AS DateTime))
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_DateAddedToCollection]  DEFAULT (getdate()) FOR [DateAddedToCollection]
GO
ALTER TABLE [dbo].[Trade] ADD  CONSTRAINT [DF_Trade_TradeDate]  DEFAULT (getdate()) FOR [TradeDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Collection_Book] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[Collection] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Collection_Book]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_User_Collection] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_User_Collection]
GO
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK_User_Follower] FOREIGN KEY([FollowerId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK_User_Follower]
GO
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK_User_UserId]
GO
ALTER TABLE [dbo].[Trade]  WITH CHECK ADD  CONSTRAINT [FK_BookOne_Trade] FOREIGN KEY([BookOneId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[Trade] CHECK CONSTRAINT [FK_BookOne_Trade]
GO
ALTER TABLE [dbo].[Trade]  WITH CHECK ADD  CONSTRAINT [FK_BookTwo_Trade] FOREIGN KEY([BookTwoId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[Trade] CHECK CONSTRAINT [FK_BookTwo_Trade]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_Book]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_User]
GO
USE [master]
GO
ALTER DATABASE [BarterBooks] SET  READ_WRITE 
GO
