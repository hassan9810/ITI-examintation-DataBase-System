﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[viewExam] @exam_id INT
AS

SELECT  q.ques_content ,mq.option1 AS 'A',ISNULL(mq.option2,'-') AS 'B' ,ISNULL(mq.option3,'-') AS 'C' ,ISNULL(mq.option4,'-') AS 'D', c.curs_name
FROM Questions q  INNER JOIN Exam_questions eq
on  q.ques_id= eq.ques_id AND eq.ex_id=@exam_id
INNER JOIN Mcq_questions mq 
ON mq.ques_id=q.ques_id
INNER JOIN Courses c 
ON c.curs_id=q.curs_id
GO