use laba;
SELECT department.DepartmentID AS "Номер кафедры",
        department.DepartmentName AS "Название кафедры"
FROM department LEFT JOIN student
 USING(DepartmentId)
WHERE StudentID IS NULL;

SELECT subject.SubjectName AS "Дисциплина", TeacherName
FROM subject LEFT JOIN teacher
USING(TeacherId)
WHERE teacher.DateOfBirth= '1980-03-29';


SELECT department.DepartmentId AS "Номер кафедры",
       department.DepartmentName AS "Название кафедры",
       COUNT(teacher.DepartmentId) AS "Кол-во преподавателей"
FROM teacher, department
WHERE department.DepartmentId=teacher.DepartmentId
GROUP BY  department.DepartmentId
UNION
SELECT department.DepartmentID AS "Номер кафедры",
        department.DepartmentName AS "Название кафедры",
        'Пустая' AS "Кол-во преподавателей"
FROM department LEFT JOIN teacher
USING(DepartmentId)
WHERE TeacherID IS NULL
GROUP BY  department.DepartmentId;