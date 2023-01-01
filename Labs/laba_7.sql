use laba;
DROP PROCEDURE IF EXISTS set_Student_Inf;
DELIMITER $$
CREATE PROCEDURE set_Student_Inf(IN _StudentName VARCHAR(255),IN _GroupName INT, IN _DepartmentID INT , IN _Schoolarship INT)
    BEGIN
   INSERT INTO StudentsGroup(StudentName, GroupName, DepartmentID, Scholarship)
   VALUES (_StudentName, _GroupName, _DepartmentID,_Schoolarship);
    END$$
DELIMITER ;
CALL set_Student_Inf('Максим', 90, 101,0);
CALL set_Student_Inf('Егор', 99, 101,0);
SELECT* FROM StudentsGroup;

###################################################################################################################################

DROP PROCEDURE IF EXISTS create_Select;
DELIMITER $$
CREATE PROCEDURE create_Select()
    BEGIN
      DROP VIEW IF EXISTS TeacherInfo;
      CREATE VIEW TeacherInfo AS SELECT teacher.TeacherName, teacher.TeacherId, teacher.DepartmentId FROM teacher;
      DROP VIEW IF EXISTS DepartmentInfo;
      CREATE VIEW DepartmentInfo AS  SELECT department.DepartmentId,
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
      GROUP BY  department.DepartmentId;
     DROP VIEW IF EXISTS TeacherDepartmentInfo;
     CREATE VIEW TeacherDepartmentInfo AS SELECT* FROM Teacherinfo LEFT JOIN DepartmentInfo USING (DepartmentId);
      DROP VIEW IF EXISTS Info;
     CREATE VIEW Info AS
     SELECT teacher.TeacherId,COUNT(subject.TeacherID) AS countSubject,SUM(subject.PeriodOfTime) AS sumTimeSubject
     FROM teacher, subject
     WHERE  teacher.TeacherId=subject.TeacherId
     GROUP BY teacher.TeacherId;
       DROP VIEW IF EXISTS TeacherView;
     CREATE VIEW TeacherView AS
       SELECT TeacherDepartmentInfo.TeacherName AS 'Имя преподователя',
       Info.countSubject AS 'Кол-во ведомых предметов',
       Info.sumTimeSubject AS 'Сумарное время по всем предметам',
       TeacherDepartmentInfo.DepartmentId AS 'Номер кафедры',
       TeacherDepartmentInfo.DepartmentName AS 'Название кафедры',
       TeacherDepartmentInfo.countStudent AS 'Кол-во студентов на кафедре'
       FROM TeacherDepartmentInfo
       LEFT JOIN info USING(TeacherId);
      SELECT * FROM TeacherView;
      DROP VIEW IF EXISTS TeacherInfo;
      DROP VIEW IF EXISTS Info;
      DROP VIEW IF EXISTS TeacherDepartmentInfo;
      DROP VIEW IF EXISTS DepartmentInfo;
      DROP VIEW IF EXISTS TeacherView;
    END$$
DELIMITER ;

CALL create_Select;

##########################################################################################

DROP PROCEDURE IF EXISTS get_count_mark;
DELIMITER $$
CREATE PROCEDURE get_count_mark(OUT countMark INT, IN markValue INT)
    BEGIN
        set markValue = ifnull(markValue,5);
        SELECT count(mark) into countMark FROM mark
        Where mark=markValue;
    END$$
DELIMITER ;

CALL get_count_mark(@countMark,null);

SELECT @countMark;






