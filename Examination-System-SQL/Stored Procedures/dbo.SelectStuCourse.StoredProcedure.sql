USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[SelectStuCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[SelectStuCourse]
As
Begin
	select*
	from Stu_course
End
GO
