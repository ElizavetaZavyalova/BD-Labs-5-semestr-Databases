use laba;
INSERT INTO department (DepartmentName, DirectorName,DepartmentId)
VALUES ('К_101', 'Заведущий_К_101', 101),
       ('К_102', 'Заведущий_К_102', 102),
       ('К_302', 'Заведущий_К_302', 302),
       ('К_405', 'Заведущий_К_405', 405),
       ('К_307', 'Заведущий_К_307', 307),
       ('К_701', 'Заведущий_К_701', 701),
       ('К_813', 'Заведущий_К_813', 813);

INSERT INTO student (StudentName, Scholarship,PlaceOfLiving,GroupName,DepartmentID,DateOfBirth,AGE)
VALUES ('Студент_1',2000, 'Пекин',9, 101, '2002-11-06', 17),
       ('Студент_2', 0, 'Новгрод',7, 101, '2001-09-10', 18),
       ('Студент_3',3000, 'Питербург',4, 102, '2000-06-26', 19),
       ('Студент_4', 0, 'Сочи',8, 101, '2001-08-02', 18),
       ('Студент_5',2000, 'Красногорск',5, 307, '2003-11-26', 16),
       ('Студент_6', 0, 'Рязань',7, 307, '1999-01-12', 21),
       ('Студент_7',0, 'Лондон',9, 101, '2002-03-30', 17),
       ('Студент_8', 0, 'Крым',5, 101, '2001-11-16', 18),
       ('Студент_9',2000, 'Москва',7, 101, '1999-01-06', 21),
       ('Студент_10', 0, 'Питербург',7, 101, '2001-05-12', 18),
       ('Студент_11',2000, 'Пекин',4, 101, '2002-11-06', 17),
       ('Студент_12', 0, 'Новгрод',4, 101, '2001-09-10', 18),
       ('Студент_13',3000, 'Питербург',4, 102, '2000-06-26', 19),
       ('Студент_14', 0, 'Сочи',4, 101, '2001-08-02', 18),
       ('Студент_15',2000, 'Красногорск',4, 307, '2003-11-26', 16),
       ('Студент_16', 0, 'Рязань',4, 307, '1999-01-12', 21),
       ('Студент_17',0, 'Лондон',4, 101, '2002-03-30', 17),
       ('Студент_18', 0, 'Крым',4, 101, '2001-11-16', 18),
       ('Студент_19',2000, 'Москва',4, 101, '1999-01-06', 21),
       ('Студент_20', 0, 'Питербург',4, 101, '2001-05-12', 18),
        ('Студент_22',0, 'Лондон',4, 101, '2002-03-30', 17),
       ('Студент_23', 0, 'Крым',4, 101, '2001-11-16', 18),
       ('Студент_24',2000, 'Москва',4, 101, '1999-01-06', 21),
       ('Студент_25', 0, 'Питербург',4, 101, '2001-05-12', 18),
       ('Студент_26',2000, 'Пекин',4, 101, '2002-11-06', 17),
       ('Студент_27', 0, 'Новгрод',4, 101, '2001-09-10', 18),
       ('Студент_28',3000, 'Питербург',4, 102, '2000-06-26', 19),
       ('Студент_29', 0, 'Сочи',4, 101, '2001-08-02', 18),
       ('Студент_30',2000, 'Красногорск',4, 307, '2003-11-26', 16),
       ('Студент_31', 0, 'Рязань',4, 307, '1999-01-12', 21),
       ('Студент_31',0, 'Лондон',4, 101, '2002-03-30', 17),
       ('Студент_33', 0, 'Крым',4, 101, '2001-11-16', 18),
       ('Студент_34',2000, 'Москва',4, 101, '1999-01-06', 21),
       ('Студент_35', 0, 'Питербург',4, 101, '2001-05-12', 18);

INSERT INTO teacher (TeacherName, DepartmentId,AGE,DateOfBirth)
VALUES ('Учитель_1',101, 60, '1967-11-06'),
       ('Учитель_2',102, 55, '1980-03-29'),
       ('Учитель_3',102, 55, '1973-08-06'),
       ('Учитель_4',307, 59, '1980-03-29'),
       ('Учитель_5',405, 60, '1980-03-29'),
       ('Учитель_6',302, 55, '1973-09-06');


INSERT INTO subject (SubjectName,PeriodOfTime, TeacherId)
VALUES ('Предмет_1', 90, 1),
       ('Предмет_2', 70, 1),
       ('Предмет_3', 80, 1),
       ('Предмет_3', 60, 2),
       ('Предмет_3', 80, 3),
       ('Предмет_4', 20, 1),
       ('Предмет_4', 80, 5),
       ('Предмет_2', 20, 4),
       ('Предмет_1', 30, 4);

INSERT INTO mark(SubjectId, Mark,StudentID)
VALUES (1,3, 1),
       (2,5, 1),
       (3,4, 3),
       (1,3, 3),
       (5,3, 6),
       (6,3, 6),
       (7,5, 5),
       (8,4, 4),
       (9,3, 3);
INSERT INTO mark(SubjectId, Mark,StudentID)
VALUES (1,3, 11),
       (1,5, 12),
       (1,4, 13),
       (1,3, 14),
       (1,3, 15),
       (1,3, 16),
       (1,5, 17),
       (1,4, 18),
       (1,3, 19);
DELETE FROM student
WHERE StudentName='Студент_10';

UPDATE mark
SET mark.Mark=3
WHERE mark.Mark!=5;

SELECT mark.Mark FROM mark
WHere Mark=5;

SELECT mark.Mark FROM mark
WHere Mark<5;

SELECT mark.Mark FROM mark
WHere Mark!=2;

SELECT mark.Mark FROM mark
WHere Mark>3;

#BETWEEN
SELECT mark.Mark FROM mark
WHERE Mark BETWEEN 3  AND 5;

SELECT PeriodOfTime, SubjectName FROM subject
WHERE PeriodOfTime BETWEEN 70  AND 90;

SELECT AGE,TeacherName FROM teacher
WHERE AGE BETWEEN 54  AND 60;

#IN
SELECT AGE,TeacherName FROM teacher
WHERE AGE IN(55,59);

SELECT DepartmentName,DirectorName FROM department
WHERE DepartmentName IN('К_102','К_405');

SELECT AGE,StudentName, Scholarship FROM student
WHERE Scholarship IN(2000,0);

#LIKE
SELECT DirectorName
FROM department
WHERE department.DirectorName LIKE '%1';


SELECT SubjectName,PeriodOfTime
FROM subject
WHERE subject.SubjectName LIKE '%3';

SELECT StudentName,PlaceOfLiving
FROM student
WHERE student.PlaceOfLiving LIKE 'П%';

#DISTINCT
SELECT DISTINCT SubjectName
FROM subject;

SELECT DISTINCT GroupName
FROM student;

SELECT DISTINCT PlaceOfLiving
FROM student;
