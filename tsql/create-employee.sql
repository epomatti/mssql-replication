USE [contosodb]
GO

/****** Object:  Table [dbo].[employee]    Script Date: 4/18/2024 10:08:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[employee](
	[id] [int] NOT NULL PRIMARY KEY,
	[name] [nchar](100) NOT NULL,
	[active] [bit] NOT NULL,
	[department] [nchar](40) NOT NULL,
	[date] [date] NOT NULL
) ON [PRIMARY]
GO
