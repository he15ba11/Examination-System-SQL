USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[ExamAnswers]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ExamAnswers]
@stu_id int, @exam_id int , @ques_id int ,@std_ans varchar(50)
as
Begin
     IF  not exists ( select 1 from student where id=@stu_id)
	 Begin
	 print 'The Student does not exist '
	 End
	Else IF  not exists ( select 1 from exam where exam_id=@exam_id)
	 Begin
	 print 'The Exam does not exist '
	 End
	Else IF  not exists ( select 1 from question where id=@ques_id)
	 Begin
	 print 'The Question does not exist '
	 End
    Else 
	 Begin
	 insert into test(stu_id, exam_id,question_id,answer)
	 values (@stu_id,@exam_id,@ques_id,@std_ans)
	 End

End
GO
