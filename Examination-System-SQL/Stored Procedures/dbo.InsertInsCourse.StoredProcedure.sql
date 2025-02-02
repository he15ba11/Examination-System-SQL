USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertInsCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[InsertInsCourse]
@cou_id int,
@ins_id int
As
Begin
    IF NOT EXISTS (Select 1 From Course Where id = @cou_id)
		Begin
			 print 'Course does not exist.';
			 return;
		End
	Else IF NOT EXISTS (Select 1 From Instructor Where id = @ins_id)
		Begin
			 print 'Instructor does not exist.';
			 return;
		End
	Else IF  EXISTS (Select 1 From ins_course Where ins_id = @ins_id and course_id= @cou_id )
		Begin
			 print 'Already exist ...';
			 return;
		End
	Else
		Begin
				INSERT INTO ins_course (ins_id, course_id)
				VALUES (@ins_id, @cou_id);
				return;
		End
	
End
GO
