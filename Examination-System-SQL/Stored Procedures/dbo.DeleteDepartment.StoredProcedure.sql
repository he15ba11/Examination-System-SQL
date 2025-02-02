USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartment]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDepartment] @DeptID INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Department WHERE ID = @DeptID)
        BEGIN
            PRINT 'Department does not exist.';
            RETURN;
        END
        
        DELETE FROM Department
        WHERE ID = @DeptID;
        
        PRINT 'Department information deleted successfully.';
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 547
        BEGIN
            PRINT 'Cannot delete Department. It has associated records in BranchDepartment table.';
        END
        ELSE
        BEGIN
            PRINT ERROR_MESSAGE();
        END
    END CATCH
END
GO
