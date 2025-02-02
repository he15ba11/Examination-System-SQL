USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBranch]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteBranch] @BranchID INT
AS
BEGIN
	BEGIN TRY
	 if not exists (select 1 from Branch where id=@BranchID)
	 begin
	 print 'Branch does not exist.';
	 return;
	 end
        DELETE FROM Branch
        WHERE ID = @BranchID;
        PRINT 'Branch information deleted successfully.';
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 547
        BEGIN
            PRINT 'Cannot delete branch. It has associated records in BranchDepartment table.';
        END
        ELSE
        BEGIN
            PRINT ERROR_MESSAGE();
        END
    END CATCH
END
GO
