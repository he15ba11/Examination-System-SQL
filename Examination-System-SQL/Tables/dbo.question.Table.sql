USE [iti]
GO
/****** Object:  Table [dbo].[question]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [int] NOT NULL,
	[title] [varchar](max) NOT NULL,
	[type] [nchar](10) NOT NULL,
	[correct_answer] [varchar](max) NOT NULL,
	[grade] [int] NOT NULL,
	[courseId] [int] NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_Course] FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_Course]
GO
