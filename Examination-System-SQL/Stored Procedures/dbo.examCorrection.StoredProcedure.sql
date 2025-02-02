USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[examCorrection]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [dbo].[examCorrection] @examID int,@StudentName varchar(max)
  as
  begin
	declare @ExamScore decimal,@totalStudentGrade int,@Fname varchar(max),@lname varchar(max),@studentID int,@spaceIndex int,@Percentage decimal
	select @ExamScore=Exam_score from exam where exam_id=@examID
	set @spaceIndex=CHARINDEX(' ',@StudentName)
	set @Fname=SUBSTRING(@StudentName,1,@spaceIndex-1)
	set @lname=SUBSTRING(@StudentName,@spaceIndex+1,len(@StudentName)-1)
	select @studentID=id from student where fname=@Fname and lname=@lname
	select @totalStudentGrade=sum(grade) from test where stu_id=@studentID and exam_id=@examID
	select @Percentage=(@totalStudentGrade / @ExamScore)*100
	PRINT 'Percentage: ' + FORMAT(@Percentage, '0.00') + '%';
  end
GO
