USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateStuCourse]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[UpdateStuCourse]
@cou_id int,
@stu_id int
As
Begin
 IF  EXISTS (Select 1 From Stu_course Where Crs_id = @cou_id AND stu_id = @stu_id)

		Begin
			Update Stu_course
			Set stu_id = @stu_id,
			Crs_id = @cou_id
			Where Crs_id = @cou_id AND stu_id = @stu_id;
			print 'Stu_course record updated successfully.';
			return;
		End
	Else
        Begin
            print 'Record with the given Crs_id and stu_id does not exist in Stu_course table.';
			return;
        End

End
GO
