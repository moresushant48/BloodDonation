USE [blood]
GO

/****** Object:  Table [dbo].[users]    Script Date: 10/3/2020 12:29:29 PM ******/
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
	[bgroup] [varchar](5) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]
GO

USE [blood]
GO

/****** Object:  Table [dbo].[roles]    Script Date: 10/3/2020 12:34:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[roles](
	[role_id] [int] NOT NULL,
	[role_name] [varchar](15) NOT NULL,
	[role_desc] [varchar](30) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

