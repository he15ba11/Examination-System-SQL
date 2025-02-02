USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertStudent](@fname varchar(20),@lname varchar(20),@gender char(1),@age int)
as
begin
begin try
declare @stId int;
    select @stId = max(id) from student;
    set @stId = coalesce(@stId, 0) + 1;
	if @gender not in ('m','M','f','F')
	begin
	print 'Invalid Gender . It must be [f or F or m or M]';
	return;
	end
	insert into Student (id,fname, lname, gender,age)
    values (@stId,@fname, @lname, @gender ,@age); 
	print 'Student information Inserted successfully.';
	return;
end try
begin catch
print error_message();
end catch
end;
GO
