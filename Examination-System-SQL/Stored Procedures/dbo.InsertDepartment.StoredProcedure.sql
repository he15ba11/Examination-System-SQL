USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertDepartment]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertDepartment](@deptName VARCHAR(10))
as
begin
begin try
declare @dId int;
    select @dId = max(id) from Department;
    set @dId = coalesce(@dId, 0) + 1;
  insert into Department(id,deptName)
  values (@dId,@deptName);
  print 'Department information Inserted successfully.';
end try
begin catch
print error_message();
end catch
end;
GO
