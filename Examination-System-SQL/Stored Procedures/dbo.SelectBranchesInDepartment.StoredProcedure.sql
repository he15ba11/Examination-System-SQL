USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[SelectBranchesInDepartment]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectBranchesInDepartment] 
    @DeptID INT = NULL, 
    @DeptName NVARCHAR(100) = NULL
AS
BEGIN
    BEGIN TRY
        IF @DeptID IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM BranchDepartment WHERE dept_id = @DeptID)
            BEGIN
                PRINT 'Branches for this Department do not exist.';
                RETURN;
            END
            ELSE
            BEGIN
                SELECT B.*
                FROM Branch B
                INNER JOIN BranchDepartment BD ON B.ID = BD.branch_id
                WHERE BD.dept_id = @DeptID;
            END
        END
        ELSE IF @DeptName IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT 1 
                           FROM Branch B
                           INNER JOIN Department D ON B.ID = D.ID
                           INNER JOIN BranchDepartment BD ON B.ID = BD.branch_id
                           WHERE D.DeptName = @DeptName)
            BEGIN
                PRINT 'Branches for this Department do not exist.';
                RETURN;
            END
            ELSE
            BEGIN
                SELECT B.*
                FROM Branch B
                INNER JOIN Department D ON B.ID = D.ID
                INNER JOIN BranchDepartment BD ON B.ID = BD.branch_id
                WHERE D.DeptName = @DeptName;
            END
        END
        ELSE
        BEGIN
            PRINT 'Please provide either @DeptID or @DeptName.';
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
