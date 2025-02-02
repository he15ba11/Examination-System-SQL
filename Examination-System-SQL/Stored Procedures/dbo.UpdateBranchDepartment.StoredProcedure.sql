USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateBranchDepartment]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBranchDepartment] 
    @BranchID INT, 
    @DeptID INT, 
    @NewBranchID INT, 
    @NewDeptID INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM BranchDepartment WHERE branch_id = @BranchID AND dept_id = @DeptID)
        BEGIN
            PRINT 'Branch Department does not exist.';
            RETURN;
        END

        UPDATE BranchDepartment
        SET branch_id = @NewBranchID,
            dept_id = @NewDeptID
        WHERE branch_id = @BranchID AND dept_id = @DeptID;

        PRINT 'BranchDepartment information updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
