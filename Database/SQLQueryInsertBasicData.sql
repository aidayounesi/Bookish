CREATE DATABASE Bookish
GO

USE [Bookish]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[book](
	[id] [int] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[authors] [nvarchar](200) NOT NULL,
	[isbn] [char](10) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[book_instance](
	[id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[barcode] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_book_instance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[book_instance]  WITH CHECK ADD  CONSTRAINT [FK_book_instance_book_instance] FOREIGN KEY([id])
REFERENCES [dbo].[book_instance] ([id])
GO

ALTER TABLE [dbo].[book_instance] CHECK CONSTRAINT [FK_book_instance_book_instance]
GO

CREATE TABLE [dbo].[check_out](
	[id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[due_date] [date] NOT NULL,
 CONSTRAINT [PK_check_out] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[check_out]  WITH CHECK ADD  CONSTRAINT [FK_check_out_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([id])
GO

ALTER TABLE [dbo].[check_out] CHECK CONSTRAINT [FK_check_out_book]
GO

ALTER TABLE [dbo].[check_out]  WITH CHECK ADD  CONSTRAINT [FK_check_out_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO

ALTER TABLE [dbo].[check_out] CHECK CONSTRAINT [FK_check_out_user]
GO


CREATE TABLE [dbo].[user](
	[id] [int] NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[hashed_password] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT INTO [Bookish].[dbo].[book] VALUES (1, 'Who is Pele?', 'JAMES BUCKLEY, JR.', '9780395419'),
(2, 'A Column of Fire', 'Ken Follett', '9781727757'),
(3, 'The Fall of Gondolin', 'J. R. R. Tolkien', '9780995429'),
(4, 'End Game', 'David Baldacci ', '9781447415');
