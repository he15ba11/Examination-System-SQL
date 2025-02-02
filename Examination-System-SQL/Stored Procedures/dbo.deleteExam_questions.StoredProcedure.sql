USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[deleteExam_questions]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteExam_questions] @ExId int, @QuId int
as
	if exists(select * from exam_question where exam_id=@ExId and ques_id=@QuId)
	begin
		delete from exam_question where exam_id=@ExId and ques_id=@QuId
	end
	else
		RAISERROR ('the combination of ExId and QeId is not exists to Delete', 16, 1)
					return;
GO
