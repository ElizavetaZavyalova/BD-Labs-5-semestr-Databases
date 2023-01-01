DROP PROCEDURE IF EXISTS sessiaResault;
DELIMITER $$
CREATE PROCEDURE sessiaResault(IN _StudentGroupName INT)
    BEGIN
    SET @@session.sql_notes = 0;
     DROP TEMPORARY  TABLE  if exists sessia;
   CREATE TEMPORARY TABLE IF NOT EXISTS sessia AS
    SELECT Subject.subjectName AS 'NameSubject',
           Student.StudentName AS 'NameStudent',
           Mark.Mark AS 'Mark'
   FROM Subject,Student, Mark
   WHERE mark.StudentID=student.StudentID AND student.GroupName=_StudentGroupName AND  subject.SubjectID=mark.SubjectID;
    SET @@session.sql_notes = 1;
    END$$
DELIMITER ;
CALL sessiaResault(4);
DELETE FROM teacher WHERE teacher.TeacherName='Учитель_1';
########################################################################################################################
DROP TRIGGER IF EXISTS  new_teacher;
DELIMITER $$
CREATE TRIGGER new_teacher BEFORE INSERT ON teacher
    FOR EACH ROW
    BEGIN
    set NEW.DepartmentId = ifnull(NEW.DepartmentId,813);
    END;
DELIMITER ;

INSERT INTO teacher (TeacherName, DepartmentId,AGE,DateOfBirth)
VALUES ('Учитель_TRigger_1',null, 60, '1967-11-06'),
       ('Учитель_TRigger_1',102, 55, '1980-03-29');
########################################################################################################################

DROP TRIGGER IF EXISTS  new_Student_before;
DELIMITER $$
CREATE TRIGGER new_Student_before BEFORE INSERT ON student
    FOR EACH ROW
    BEGIN
    if((SELECT count(*) FROM student where GroupName=NEW.GroupName)>25)
        THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Слишком много студентов в группе';
    end if;
    END;
DELIMITER ;

INSERT INTO student (StudentName, Scholarship,PlaceOfLiving,GroupName,DepartmentID,DateOfBirth,AGE)
VALUES ('Студент_Trigger',2000, 'Пекин',4, 101, '2002-11-06', 17);

########################################################################################################################
DROP PROCEDURE IF EXISTS update_teachers;
DELIMITER $$
CREATE PROCEDURE update_teachers(IN _DepartmentId INT)
    BEGIN
    UPDATE department
    SET department.CountTeacher=(SELECT count(*) FROM teacher where teacher.DepartmentId=_DepartmentId)
    WHERE department.DepartmentId=_DepartmentId;
    END$$
DELIMITER ;

DROP TRIGGER IF EXISTS  new_Teacher_Department_Insert;
DELIMITER $$
CREATE TRIGGER  new_Teacher_Department_Insert after INSERT ON teacher
    FOR EACH ROW
    BEGIN
    Call update_Teachers(NEW.DepartmentId);
    END;
DELIMITER ;

DROP TRIGGER IF EXISTS  new_Teacher_Department_Delete;
DELIMITER $$
CREATE TRIGGER  new_Teacher_Department_Delete after DELETE ON teacher
    FOR EACH ROW
    BEGIN
   Call update_Teachers(OLD.DepartmentId);
    END;
DELIMITER ;

DROP TRIGGER IF EXISTS  new_Teacher_Department_Update;
DELIMITER $$
CREATE TRIGGER  new_Teacher_Department_update after update ON teacher
    FOR EACH ROW
    BEGIN
    Call update_Teachers(OLD.DepartmentId);
    Call update_Teachers(NEW.DepartmentId);
    END;
DELIMITER ;

