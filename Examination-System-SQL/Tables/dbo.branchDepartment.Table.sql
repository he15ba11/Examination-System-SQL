USE [iti]
GO
/****** Object:  Table [dbo].[branchDepartment]    Script Date: 5/8/2024 8:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branchDepartment](
	[dept_id] [int] NOT NULL,
	[branch_id] [int] NOT NULL,
 CONSTRAINT [PK_branchDepartment] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC,
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[branchDepartment]  WITH CHECK ADD  CONSTRAINT [FK_branchDepartment_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[branchDepartment] CHECK CONSTRAINT [FK_branchDepartment_Branch]
GO
ALTER TABLE [dbo].[branchDepartment]  WITH CHECK ADD  CONSTRAINT [FK_branchDepartment_Department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[Department] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[branchDepartment] CHECK CONSTRAINT [FK_branchDepartment_Department]
GO
