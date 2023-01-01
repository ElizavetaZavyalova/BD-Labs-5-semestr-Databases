DROP DATABASE IF EXISTS laba;
CREATE DATABASE IF NOT EXISTS laba;
USE laba;
DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department(
    DepartmentName VARCHAR(255),
    DirectorName VARCHAR(255),
    DepartmentId INT NOT NULL AUTO_INCREMENT,
    CountTeacher INT NOT NULL default 1,
    PRIMARY KEY (DepartmentId)
);
DROP TABLE IF EXISTS Student;
CREATE TABLE IF NOT EXISTS Student(
  StudentName VARCHAR(255),
  StudentID  INT AUTO_INCREMENT,
  Scholarship INT,
  PlaceOfLiving VARCHAR(255),
  GroupName INT,
  DepartmentID INT,
  DateOfBirth DATE,
  AGE INT,
  PRIMARY KEY (StudentID),
  FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
DROP TABLE IF EXISTS Teacher;
CREATE TABLE IF NOT EXISTS Teacher(
     TeacherId INT NOT NULL AUTO_INCREMENT,
     TeacherName VARCHAR(255)  NOT NULL,
     DepartmentId INT,
     AGE INT NOT NULL DEFAULT 30,
     DateOfBirth DATE,
     PRIMARY KEY (TeacherId),
     FOREIGN KEY (DepartmentId)
        REFERENCES Department(DepartmentId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
DROP TABLE IF EXISTS Subject;
CREATE TABLE IF NOT EXISTS Subject(
    SubjectName VARCHAR(255)  NOT NULL,
    TeacherId INT NOT NULL ,
    SubjectID INT NOT NULL AUTO_INCREMENT,
    PeriodOfTime INT  NOT NULL DEFAULT 70,
    PRIMARY KEY (SubjectID),
    FOREIGN KEY (TeacherId)
        REFERENCES Teacher(TeacherId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
DROP TABLE IF EXISTS Mark;
CREATE TABLE IF NOT EXISTS Mark(
    SubjectID INT NOT NULL ,
    Mark INT NOT NULL DEFAULT 2,
    StudentID INT NOT NULL ,
    PRIMARY KEY (SubjectID, StudentID),
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (SubjectID)
        REFERENCES Subject(SubjectID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);