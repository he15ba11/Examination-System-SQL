USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[SelectInsCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[SelectInsCourse]
As
Begin
	select*
	from ins_course
End
GO
