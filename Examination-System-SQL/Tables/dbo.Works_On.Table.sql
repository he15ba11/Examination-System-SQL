USE [iti]
GO
/****** Object:  Table [dbo].[Works_On]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Works_On](
	[ins_id] [int] NOT NULL,
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_Works_On] PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC,
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Works_On]  WITH CHECK ADD  CONSTRAINT [FK_Works_On_Department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[Department] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Works_On] CHECK CONSTRAINT [FK_Works_On_Department]
GO
ALTER TABLE [dbo].[Works_On]  WITH CHECK ADD  CONSTRAINT [FK_Works_On_Instructor] FOREIGN KEY([ins_id])
REFERENCES [dbo].[Instructor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Works_On] CHECK CONSTRAINT [FK_Works_On_Instructor]
GO
