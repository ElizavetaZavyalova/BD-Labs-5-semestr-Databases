use laba;
DROP VIEW IF EXISTS StudentsGroup;
CREATE VIEW StudentsGroup AS
SELECT StudentName, GroupName,DepartmentID,Scholarship
FROM student
WHERE Scholarship=0;
INSERT INTO StudentsGroup(StudentName, GroupName, DepartmentID,Scholarship)
VALUES ('Студент_90', 91, 101,0);
SELECT* FROM StudentsGroup;


DROP VIEW IF EXISTS StudentsView;
CREATE VIEW StudentsView AS
SELECT student.StudentId, student.StudentName,  department.*
FROM student, department
WHERE student.DepartmentID=department.DepartmentId;
SELECT *FROM StudentsView;

DROP VIEW IF EXISTS TeacherView;
CREATE VIEW TeacherView AS
SELECT TeacherDepartmentInfo.TeacherName AS 'Имя преподователя',
       Info.countSubject AS 'Кол-во ведомых предметов',
       Info.sumTimeSubject AS 'Сумарное время по всем предметам',
       TeacherDepartmentInfo.DepartmentId AS 'Номер кафедры',
       TeacherDepartmentInfo.DepartmentName AS 'Название кафедры',
       TeacherDepartmentInfo.countStudent AS 'Кол-во студентов на кафедре'
FROM
(SELECT*
FROM
(SELECT teacher.TeacherName, teacher.TeacherId, teacher.DepartmentId FROM teacher) TeacherInfo
LEFT JOIN
(SELECT department.DepartmentId,
       department.DepartmentName,
       COUNT(student.DepartmentId) AS countStudent
FROM department, student
WHERE department.DepartmentId=student.DepartmentId
GROUP BY  department.DepartmentId
UNION
SELECT department.DepartmentID,
        department.DepartmentName ,
        null AS countStudent
FROM department LEFT JOIN student
USING(DepartmentId)
WHERE StudentID IS NULL
GROUP BY  department.DepartmentId) DepartmentInfo
USING (DepartmentId)) TeacherDepartmentInfo
LEFT JOIN
(SELECT teacher.TeacherId,COUNT(subject.TeacherID) AS countSubject,SUM(subject.PeriodOfTime) AS sumTimeSubject
FROM teacher, subject
WHERE  teacher.TeacherId=subject.TeacherId
GROUP BY teacher.TeacherId) Info
USING(TeacherId);
Select*from Teacherview;

SELECT*
FROM
(SELECT teacher.TeacherName, teacher.TeacherId, teacher.DepartmentId FROM teacher) TeacherInfo
LEFT JOIN
(SELECT department.DepartmentId,
       department.DepartmentName,
       COUNT(student.DepartmentId) AS countStudent
FROM department, student
WHERE department.DepartmentId=student.DepartmentId
GROUP BY  department.DepartmentId
UNION
SELECT department.DepartmentID,
        department.DepartmentName ,
        null AS countStudent
FROM department LEFT JOIN student
USING(DepartmentId)
WHERE StudentID IS NULL
GROUP BY  department.DepartmentId) DepartmentInfo
USING (DepartmentId);

SELECT teacher.TeacherName, teacher.TeacherId,COUNT(subject.TeacherID) AS countSubject,SUM(subject.PeriodOfTime) AS sumTimeSubject
FROM teacher, subject
WHERE  teacher.TeacherId=subject.TeacherId
GROUP BY teacher.TeacherId


