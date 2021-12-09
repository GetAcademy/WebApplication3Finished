
/****** Object:  Table [dbo].[Interest]    Script Date: 09.12.2021 11:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interest](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Interest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 09.12.2021 11:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonInterest]    Script Date: 09.12.2021 11:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonInterest](
	[PersonId] [uniqueidentifier] NOT NULL,
	[InterestId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PersonInterest] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[InterestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Interest] ([Id], [Name]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9121', N'Golf')
GO
INSERT [dbo].[Interest] ([Id], [Name]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9122', N'Slalom')
GO
INSERT [dbo].[Interest] ([Id], [Name]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9123', N'Matlaging')
GO
INSERT [dbo].[Person] ([Id], [Name]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9151', N'Per')
GO
INSERT [dbo].[Person] ([Id], [Name]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9152', N'Pål')
GO
INSERT [dbo].[Person] ([Id], [Name]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9153', N'Espen')
GO
INSERT [dbo].[PersonInterest] ([PersonId], [InterestId]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9151', N'139913d1-3bd7-4016-974a-054e0f9a9121')
GO
INSERT [dbo].[PersonInterest] ([PersonId], [InterestId]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9151', N'139913d1-3bd7-4016-974a-054e0f9a9122')
GO
INSERT [dbo].[PersonInterest] ([PersonId], [InterestId]) VALUES (N'139913d1-3bd7-4016-974a-054e0f9a9152', N'139913d1-3bd7-4016-974a-054e0f9a9122')
GO
ALTER TABLE [dbo].[PersonInterest]  WITH CHECK ADD  CONSTRAINT [FK_PersonInterest_Interest] FOREIGN KEY([InterestId])
REFERENCES [dbo].[Interest] ([Id])
GO
ALTER TABLE [dbo].[PersonInterest] CHECK CONSTRAINT [FK_PersonInterest_Interest]
GO
ALTER TABLE [dbo].[PersonInterest]  WITH CHECK ADD  CONSTRAINT [FK_PersonInterest_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[PersonInterest] CHECK CONSTRAINT [FK_PersonInterest_Person]
GO
USE [master]
GO
ALTER DATABASE [InterestDb] SET  READ_WRITE 
GO
