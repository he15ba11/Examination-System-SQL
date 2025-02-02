USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[DeleteInsCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteInsCourse]
@cou_id int
As
Begin
    IF EXISTS (Select 1 From ins_course WHERE course_id=@cou_id)
		Begin
			Delete From ins_course WHERE course_id=@cou_id;
			print 'Record deleted successfully.';
			return;
		End
    Else
		Begin
			print 'Record with the given course_id does not exist';
		End
End
GO
