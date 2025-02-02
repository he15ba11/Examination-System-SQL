USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[deleteTest]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [dbo].[deleteTest] 
    @StudentID INT,
    @ExamID INT, 
    @QuestionID INT
  as
  begin
	if  exists(select 1 from Test where stu_id=@StudentID and exam_id=@ExamID and question_id=@QuestionID)
	begin
		delete test where stu_id=@StudentID and exam_id=@ExamID and question_id=@QuestionID
	end
	else
       RAISERROR ('Cannot delete this test because the combination already not exists in Test', 16, 1)
  end
GO
