USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[UpdateDepartment]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateDepartment] @DeptID INT, @DeptName NVARCHAR(10)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Department WHERE ID = @DeptID)
        BEGIN
            PRINT 'Department does not exist.';
            RETURN;
        END
        
        UPDATE Department
        SET DeptName = @DeptName
        WHERE ID = @DeptID;
        
        PRINT 'Department information updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
