USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[deleteQuestion]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteQuestion] @QId int
	as
	begin
		if exists(select 1 from question where id=@QId)
		begin
			delete from question where id=@QId
			print 'Deleted'
			return;
		end
		else
				RAISERROR ('the  QId is not exists to Delete ', 16, 1)
				return;
	end
GO
