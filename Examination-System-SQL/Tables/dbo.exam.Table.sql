USE [iti]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[exam_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[Exam_score] [int] NULL,
	[duration] [int] NOT NULL,
 CONSTRAINT [PK_exam] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[exam] ADD  CONSTRAINT [DF_exam_Exam_score]  DEFAULT ((100)) FOR [Exam_score]
GO
ALTER TABLE [dbo].[exam] ADD  CONSTRAINT [DF_exam_duration]  DEFAULT ((120)) FOR [duration]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK_exam_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK_exam_Course]
GO
