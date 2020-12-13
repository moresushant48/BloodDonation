USE [master]
GO

/****** Object:  Database [blood]    Script Date: 11-11-2020 18:57:31 ******/
CREATE DATABASE [blood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\blood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'blood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\blood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [blood] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [blood] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [blood] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [blood] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [blood] SET ARITHABORT OFF 
GO

ALTER DATABASE [blood] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [blood] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [blood] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [blood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [blood] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [blood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [blood] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [blood] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [blood] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [blood] SET  DISABLE_BROKER 
GO

ALTER DATABASE [blood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [blood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [blood] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [blood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [blood] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [blood] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [blood] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [blood] SET RECOVERY FULL 
GO

ALTER DATABASE [blood] SET  MULTI_USER 
GO

ALTER DATABASE [blood] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [blood] SET DB_CHAINING OFF 
GO

ALTER DATABASE [blood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [blood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [blood] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [blood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [blood] SET QUERY_STORE = OFF
GO

ALTER DATABASE [blood] SET  READ_WRITE 
GO

USE [blood]
GO

/****** Object:  Table [dbo].[users]    Script Date: 11-11-2020 18:57:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](20) NOT NULL,
	[mname] [varchar](20) NOT NULL,
	[lname] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[mobno] [varchar](10) NOT NULL,
	[bgroup] [varchar](4) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role_id] [int] NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[age] [int] NOT NULL
) ON [PRIMARY]
GO

USE [blood]
GO

/****** Object:  Table [dbo].[roles]    Script Date: 11-11-2020 18:58:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](10) NOT NULL,
	[role_desc] [varchar](30) NOT NULL
) ON [PRIMARY]
GO

USE [blood]
GO

/****** Object:  Table [dbo].[camps]    Script Date: 11-11-2020 18:58:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[camps](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[camp_date] [varchar](20) NOT NULL,
	[camp_address] [varchar](100) NOT NULL,
	[camp_time] [varchar](20) NOT NULL,
	[bank_id] [int] NOT NULL,
	[visitors] [int] NOT NULL
) ON [PRIMARY]
GO

USE [blood]
GO

/****** Object:  Table [dbo].[bloodreq]    Script Date: 11-11-2020 18:58:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bloodreq](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](20) NOT NULL,
	[mname] [varchar](20) NOT NULL,
	[lname] [varchar](20) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[blood] [varchar](4) NOT NULL,
	[status] [varchar](15) NOT NULL
) ON [PRIMARY]
GO

USE [blood]
GO

/****** Object:  Table [dbo].[bloodbanks]    Script Date: 11-11-2020 18:58:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bloodbanks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bank_name] [varchar](50) NOT NULL,
	[bank_address] [varchar](100) NOT NULL,
	[status] [varchar](5) NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
GO

USE [blood]
GO

/****** Object:  Table [dbo].[visitdetails]    Script Date: 06-12-2020 19:17:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[visitdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](20) NOT NULL,
	[mname] [varchar](20) NOT NULL,
	[lname] [varchar](20) NOT NULL,
	[age] [int] NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[blood] [varchar](4) NOT NULL,
	[camp_id] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO


