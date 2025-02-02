USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[insertquestionChoices]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertquestionChoices] ( @QId int , @ChoId int)
as 
if exists (select * from question where id=@QId)
begin
	if exists  (select * from choices where id=@ChoId)
	begin		
	if not exists(select * from questionChoices where que_id=@QId and choice_id=@ChoId)
		begin
		insert into questionChoices values (@QId, @ChoId)
							return;
		end
	else
		RAISERROR ('Cannot insert duplicate key in table', 16, 1)
							return;
	end
	else
		RAISERROR ('can not insert The ChoID it not Choice ', 16, 1)
							return;
end
else
	RAISERROR ('can not insert The QID it not Question', 16, 1)
GO
