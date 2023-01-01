DROP DATABASE IF EXISTS CourseWork;
CREATE DATABASE IF NOT EXISTS CourseWork;
USE CourseWork;
DROP TABLE IF EXISTS  Author;
CREATE TABLE IF NOT EXISTS Author(
    AuthorName  VARCHAR(255) not null ,
    AuthorId   INT NOT NULL AUTO_INCREMENT,
    AGE  INT,
    Password VARCHAR(255) not null ,
    SculpturesCount INT NOT NULL default 0,
    AuthorDateBerth DATE  NULL,
    PRIMARY KEY (AuthorId)
);
DROP TABLE IF EXISTS  Clay;
CREATE TABLE IF NOT EXISTS Clay(
    ClayName   VARCHAR(255),
    ClayColor  VARCHAR(255),
    ClayId INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ClayId)
);
DROP TABLE IF EXISTS Destiny;
CREATE TABLE IF NOT EXISTS Destiny
(
    DestinyName  VARCHAR(255),
    Instruction  MEDIUMTEXT,
    DestinyID  INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (DestinyID)
);
DROP TABLE IF EXISTS OtherMaterials;
CREATE TABLE IF NOT EXISTS OtherMaterials
(
    MaterialName  VARCHAR(255),
    HowMaterialWasUse  MEDIUMTEXT,
    MaterialID  INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (MaterialID)
);
DROP TABLE IF EXISTS PaintInformation;
CREATE TABLE IF NOT EXISTS PaintInformation
(
    PaintColorName VARCHAR(255),
    PaintViewName VARCHAR(255),
    PaintID  INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (PaintID)
);
DROP TABLE IF EXISTS Technologies;
CREATE TABLE IF NOT EXISTS Technologies
(
    TechnologiesName  VARCHAR(255),
    TechnologiesDescription MEDIUMTEXT,
    TechnologiesID  INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (TechnologiesID)
);
DROP TABLE IF EXISTS Topic;
CREATE TABLE IF NOT EXISTS Topic
(
    TopicName  VARCHAR(255),
    TopicDescription  MEDIUMTEXT,
    TopicID  INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (TopicID)
);
DROP TABLE IF EXISTS Sculpture;
CREATE TABLE IF NOT EXISTS Sculpture
(
    SculptureName  VARCHAR(255) NOT NULL,
    SculptureID  INT NOT NULL AUTO_INCREMENT,
    DateOfCreation DATE,
    SculptureDescription  MEDIUMTEXT,
    AuthorCount INT NOT NULL default 0,
    SculptureSize INT,
    PRIMARY KEY (SculptureID),
    TopicID        INT ,
    DestinyID     INT ,
    TechnologiesID  INT,
    FOREIGN KEY (TopicID)
        REFERENCES Topic(TopicID)
        ON DELETE SET  NULL
        ON UPDATE SET  NULL,
    FOREIGN KEY (TechnologiesID)
        REFERENCES Technologies(TechnologiesID)
        ON DELETE SET  NULL
        ON UPDATE SET  NULL,
     FOREIGN KEY (DestinyID)
        REFERENCES Destiny(DestinyID)
        ON DELETE SET  NULL
        ON UPDATE SET  NULL

);
DROP TABLE IF EXISTS SculptureHasAuthor;
CREATE TABLE IF NOT EXISTS SculptureHasAuthor
(
    SculptureID INT NOT NULL,
    AuthorId    INT NOT NULL,
    PRIMARY KEY (AuthorId, SculptureID),
    FOREIGN KEY (SculptureID)
        REFERENCES Sculpture(SculptureID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
     FOREIGN KEY (AuthorId)
        REFERENCES Author(AuthorId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
DROP TABLE IF EXISTS SculptureHasClay;
CREATE TABLE IF NOT EXISTS SculptureHasClay
(
    SculptureID INT NOT NULL,
    ClayId    INT NOT NULL,
    SlipClayColor VARCHAR(255),
    PRIMARY KEY (SculptureID, ClayID),
    FOREIGN KEY (SculptureID)
        REFERENCES Sculpture(SculptureID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ClayId)
        REFERENCES Clay(ClayId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
DROP TABLE IF EXISTS SculptureHasOtherMaterials;
CREATE TABLE IF NOT EXISTS SculptureHasOtherMaterials
(
    SculptureID INT NOT NULL,
    MaterialID  INT NOT NULL,
    PRIMARY KEY (SculptureID, MaterialID),
    FOREIGN KEY (SculptureID)
        REFERENCES Sculpture(SculptureID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (MaterialID)
        REFERENCES OtherMaterials(MaterialID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
DROP TABLE IF EXISTS SculptureHasPaint;
CREATE TABLE IF NOT EXISTS SculptureHasPaint
(
    SculptureID     INT NOT NULL,
    PaintId           INT NOT NULL,
    primary key (PaintId, SculptureID),
    FOREIGN KEY (SculptureID)
        REFERENCES Sculpture(SculptureID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (PaintId)
        REFERENCES PaintInformation(PaintId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
