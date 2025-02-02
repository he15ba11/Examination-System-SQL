USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[DeleteCourse]
@cou_id int
As
Begin
    IF  EXISTS (Select 1 From Course Where id = @cou_id )
		Begin
			delete from Course
			where id=@cou_id
			print 'Course information deleted successfully.';
		End
	Else
		Begin
		  print 'Course does not exist.';
		End
End
GO
