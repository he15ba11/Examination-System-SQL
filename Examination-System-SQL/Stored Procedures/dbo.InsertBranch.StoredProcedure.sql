USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[InsertBranch]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[InsertBranch](@locationName VARCHAR(10))
as
begin
begin try
declare @bId int;
    select @bId = max(id) from Branch;
    set @bId = coalesce(@bId, 0) + 1;
  insert into Branch(id,Location_Name)
  values (@bId,@locationName);
  print 'Branch information Inserted successfully.';
end try
begin catch
print error_message();
end catch
end;
GO
