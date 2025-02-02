USE [iti]
GO
/****** Object:  Table [dbo].[Stu_course]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stu_course](
	[stu_id] [int] NOT NULL,
	[Crs_id] [int] NOT NULL,
 CONSTRAINT [PK_Stu_course] PRIMARY KEY CLUSTERED 
(
	[stu_id] ASC,
	[Crs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stu_course]  WITH CHECK ADD  CONSTRAINT [FK_Stu_course_Course] FOREIGN KEY([Crs_id])
REFERENCES [dbo].[Course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stu_course] CHECK CONSTRAINT [FK_Stu_course_Course]
GO
ALTER TABLE [dbo].[Stu_course]  WITH CHECK ADD  CONSTRAINT [FK_Stu_course_student] FOREIGN KEY([stu_id])
REFERENCES [dbo].[student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stu_course] CHECK CONSTRAINT [FK_Stu_course_student]
GO
