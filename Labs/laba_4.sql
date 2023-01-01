use laba;
SELECT laba.teacher.TeacherName AS "ФИО преподавателя"
FROM  laba.subject, laba.teacher
WHERE laba.teacher.TeacherId=laba.subject.TeacherID
AND laba.subject.PeriodOfTime=(SELECT Max(laba.subject.PeriodOfTime) FROM laba.subject)
GROUP BY laba.teacher.TeacherName;

SELECT  department.DepartmentID AS "Номер кафедры",
        department.DepartmentName AS "Название кафедры", COUNT(distinct laba.student.PlaceOfLiving)
FROM department, student
WHERE department.DepartmentId=Student.DepartmentID
 AND laba.student.DepartmentID=(SELECT laba.student.DepartmentID
FROM department, student
WHERE department.DepartmentId=Student.DepartmentID
GROUP BY department.DepartmentId
HAVING COUNT(distinct laba.student.PlaceOfLiving)>=4)
GROUP BY department.DepartmentId;


SELECT PeriodOfTime FROM subject;

UPDATE subject
SET PeriodOfTime=PeriodOfTime+30
WHERE  PeriodOfTime < (SELECT * FROM (SELECT AVG(PeriodOfTime)  FROM subject) AS period);

SELECT PeriodOfTime FROM subject;