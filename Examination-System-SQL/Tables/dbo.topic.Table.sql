USE [iti]
GO
/****** Object:  Table [dbo].[topic]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topic](
	[topic_id] [int] NOT NULL,
	[course_id] [int] NULL,
	[topic_name] [nchar](10) NULL,
 CONSTRAINT [PK_topic] PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[topic]  WITH CHECK ADD  CONSTRAINT [FK_topic_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[topic] CHECK CONSTRAINT [FK_topic_Course]
GO
