USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[deleteExam]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[deleteExam](@id int)
as 
begin 
	if not exists (select * from exam where exam_id = @id )
		begin 
			print 'the exam not existed'
			return
		end
	begin try
		delete from exam where exam_id = @id
	end try
	begin catch
		print error_message()
	end catch
end
GO
