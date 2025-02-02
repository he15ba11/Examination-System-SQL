USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[insertExam_questions]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertExam_questions] ( @ExId int , @QeId int)
as 
if exists (select * from exam where exam_id=@ExId)
begin
	if exists  (select * from question where id=@QeId)
	begin		
	if not exists(select * from exam_question where exam_id=@ExId and ques_id=@QeId)
		insert into exam_question values (@ExId,@QeId)
	else
		RAISERROR ('Cannot insert duplicate key in table', 16, 1)
	end
	else
		RAISERROR ('can not insert The QeID it does not exist in the parent table ', 16, 1)

end
else
	RAISERROR ('can not insert The ExID it does not exist in the parent table ', 16, 1)
GO
