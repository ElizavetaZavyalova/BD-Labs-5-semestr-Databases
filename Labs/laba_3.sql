use laba;
SELECT  department.DepartmentID AS "Номер кафедры",
        department.DepartmentName AS "Название кафедры" ,
        avg(student.Scholarship) AS "Средняя стипендия"
FROM department, student
WHERE department.DepartmentId=Student.DepartmentID
GROUP BY department.DepartmentId;

SELECT laba.teacher.TeacherName AS "ФИО преподавателя"
FROM  laba.subject, laba.teacher
WHERE laba.teacher.TeacherId=laba.subject.TeacherID
GROUP BY laba.teacher.TeacherName
HAVING COUNT(distinct laba.subject.SubjectName)>=4;

SELECT department.DepartmentID AS "Номер кафедры",
       department.DepartmentName AS "Название кафедры"
FROM  laba.department, laba.subject, laba.teacher
WHERE laba.department.DepartmentId=laba.teacher.DepartmentID
  AND  laba.subject.TeacherId=laba.teacher.TeacherId
GROUP BY laba.department.DepartmentId
HAVING AVG(subject.PeriodOfTime) >=50;