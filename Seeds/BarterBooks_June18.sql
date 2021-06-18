USE [master]
GO
/****** Object:  Database [BarterBooks]    Script Date: 6/18/2021 5:44:40 PM ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 6/18/2021 5:44:41 PM ******/
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
	[PublishDate] [datetime] NOT NULL,
	[PageCount] [int] NOT NULL,
	[DateAddedToCollection] [datetime] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 6/18/2021 5:44:41 PM ******/
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
/****** Object:  Table [dbo].[Follower]    Script Date: 6/18/2021 5:44:41 PM ******/
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
/****** Object:  Table [dbo].[Trade]    Script Date: 6/18/2021 5:44:41 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 6/18/2021 5:44:41 PM ******/
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
/****** Object:  Table [dbo].[WishList]    Script Date: 6/18/2021 5:44:41 PM ******/
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

INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (1, 7, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', CAST(N'2017-02-02T00:00:00.000' AS DateTime), 64, CAST(N'2021-06-18T17:29:39.330' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (2, 7, N'Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out', N'http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Felicity Baker', CAST(N'2017-02-02T00:00:00.000' AS DateTime), 64, CAST(N'2021-06-18T17:30:06.143' AS DateTime))
INSERT [dbo].[Book] ([Id], [CollectionId], [Name], [Image], [Author], [PublishDate], [PageCount], [DateAddedToCollection]) VALUES (3, 7, N'Harry Potter Coloring Book', N'http://books.google.com/books/content?id=lMM4jgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', N'Inc. Scholastic', CAST(N'2015-11-10T00:00:00.000' AS DateTime), 96, CAST(N'2021-06-18T17:30:21.167' AS DateTime))
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
