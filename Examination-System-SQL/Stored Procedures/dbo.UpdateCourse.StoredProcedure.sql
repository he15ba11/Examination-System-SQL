USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[UpdateCourse]
@cou_id int,
@cou_name varchar(50)
As
Begin
    IF  EXISTS (Select 1 From Course Where id = @cou_id )
		Begin
			update Course
			set Crs_name= @cou_name
			where id=@cou_id
			print 'Course information updated successfully.';
		End
	Else
		Begin
		  print 'Course does not exist.';
		End
End
GO
