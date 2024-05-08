USE [iti]
GO
/****** Object:  StoredProcedure [dbo].[selectExam_questions]    Script Date: 5/8/2024 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectExam_questions]
as
	if exists(select * from exam_question)
	select  exam_id as ExId, eq.ques_id as QeId   from exam_question eq
	else
	select 'table is empty' as message
GO
