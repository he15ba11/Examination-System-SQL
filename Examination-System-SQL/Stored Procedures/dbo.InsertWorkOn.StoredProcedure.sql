USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertWorkOn]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertWorkOn](@insId int , @deptId int)
as
begin
begin try
	 if not exists (select 1 from Instructor where id=@insId)
	 begin
	 print 'Instructor does not exist.';
	 return;
	 end
	 if not exists (select 1 from Department where id=@deptId)
	 begin
	 print 'Department does not exist.';
	 return;
	 end
	 insert into Works_On (ins_id,dept_id)
	 values(@insId,@deptId);
	 return;
end try
begin catch
print error_message();
end catch
end
GO
