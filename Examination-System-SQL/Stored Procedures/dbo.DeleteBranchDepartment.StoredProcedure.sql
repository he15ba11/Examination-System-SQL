USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBranchDepartment]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteBranchDepartment] @BranchID INT, @DeptID INT
AS
BEGIN
    BEGIN TRY
	if not exists (select 1 from BranchDepartment where branch_id =@BranchID and dept_id = @DeptID )
	 begin
	 print 'Branch Department does not exist.';
	 return;
	 end
        DELETE FROM BranchDepartment
        WHERE branch_id = @BranchID AND dept_id = @DeptID
    PRINT 'Branch Department information deleted successfully.';
    END TRY
    BEGIN CATCH
            PRINT ERROR_MESSAGE();
    END CATCH
END
GO
