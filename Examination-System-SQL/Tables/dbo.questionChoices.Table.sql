USE [iti]
GO
/****** Object:  Table [dbo].[questionChoices]    Script Date: 5/8/2024 8:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questionChoices](
	[que_id] [int] NOT NULL,
	[choice_id] [int] NOT NULL,
 CONSTRAINT [PK_choices] PRIMARY KEY CLUSTERED 
(
	[que_id] ASC,
	[choice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[questionChoices]  WITH CHECK ADD  CONSTRAINT [FK_questionChoices_choices] FOREIGN KEY([choice_id])
REFERENCES [dbo].[choices] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[questionChoices] CHECK CONSTRAINT [FK_questionChoices_choices]
GO
ALTER TABLE [dbo].[questionChoices]  WITH CHECK ADD  CONSTRAINT [FK_questionChoices_question] FOREIGN KEY([que_id])
REFERENCES [dbo].[question] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[questionChoices] CHECK CONSTRAINT [FK_questionChoices_question]
GO
